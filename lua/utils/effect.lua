--
--
-- TODO:
--  This is sort of a big hack and an exploration into interacting
--  with the LSP through an NVIM plugin - there's several different ways
--  this could be better. If it's to stay an nvim plugin it should use
--  "textDocument/typeDefinition" and register a code action
--
--  but really I should make a pull request to 
--  https://github.com/Effect-TS/language-service with a proper action
--

local M = {}

local DEBUG = false
local print = DEBUG and print or function() end

local function get_object_node_from_call(node)
  for i = 0, node:named_child_count() - 1 do
    local child = node:named_child(i)
    if child:type() == "arguments" then
      for j = 0, child:named_child_count() - 1 do
        local arg = child:named_child(j)
        if arg:type() == "object" then
          return arg
        end
      end
    end
  end
  return nil
end

local function query_lsp_hover(bufnr, client, node, callback)
  -- Get the position at the END of the function name (after "catchTags")
  local start_line, start_col, end_line, end_col = node:range()
  
  print("Debug: Client name: " .. client.name)
  print("Debug: Node range - start: line=" .. start_line .. ", col=" .. start_col .. 
        ", end: line=" .. end_line .. ", col=" .. end_col)
  
  -- Use the end position of the node (right after "catchTags")
  print("Debug: Trying textDocument/hover at line=" .. end_line .. ", col=" .. end_col)
  
  local params = {
    textDocument = vim.lsp.util.make_text_document_params(bufnr),
    position = { line = end_line, character = end_col }
  }
  
  client.request("textDocument/hover", params, function(err, result)
    if err then 
      print("Debug: Hover error: " .. vim.inspect(err))
      return callback({})
    end
    if not result or not result.contents then
      print("Debug: No hover result")
      return callback({})
    end
    
    -- Extract text from hover result
    local hover_text = ""
    if type(result.contents) == "string" then
      hover_text = result.contents
    elseif result.contents.value then
      hover_text = result.contents.value
    elseif type(result.contents) == "table" and result.contents[1] then
      if type(result.contents[1]) == "string" then
        hover_text = result.contents[1]
      elseif result.contents[1].value then
        hover_text = result.contents[1].value
      end
    end
    
    print("Debug: Hover text length: " .. #hover_text)
    print("Debug: Hover text preview: " .. hover_text:sub(1, 300))
    
    -- Try to extract Error types from hover text
    -- Looking for patterns like: Effect<A, E1 | E2 | E3, R>
    local types = {}
    
    -- Try multiple patterns
    local effect_match = hover_text:match("Effect%s*<%s*[^,]+,%s*([^,>]+)") or
                         hover_text:match("Effect%.Effect%s*<%s*[^,]+,%s*([^,>]+)")
    
    if effect_match then
      print("Debug: Found Effect error types: " .. effect_match)
      for error_type in effect_match:gmatch("[^|]+") do
        local trimmed = error_type:match("^%s*(.-)%s*$")
        if trimmed ~= "never" and trimmed ~= "" then
          print("Debug: Adding error type: " .. trimmed)
          table.insert(types, trimmed)
        end
      end
    else
      print("Debug: No Effect pattern match found in hover text")
      print("Debug: Full hover text: " .. hover_text)
    end
    
    print("Debug: Extracted types: " .. vim.inspect(types))
    return callback(types)
  end, bufnr)
end


function M.fill_effect_cases(bufnr, client)
  local win = vim.api.nvim_get_current_win()
  local cursor = vim.api.nvim_win_get_cursor(win)
  local row, col = cursor[1] - 1, cursor[2]
  
  print("Debug: Getting node at cursor")
  print("Row: " .. row .. ", Col: " .. col)
  
  -- Find the correct TypeScript LSP client (not copilot)
  local ts_client = nil
  for _, c in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    print("Debug: Found client: " .. c.name)
    if c.name == "vtsls" or c.name == "tsserver" or c.name == "typescript-tools" then
      ts_client = c
      print("Debug: Using TypeScript client: " .. c.name)
      break
    end
  end
  
  if not ts_client then
    vim.notify("No TypeScript LSP client found", vim.log.levels.ERROR)
    return
  end
  
  local node = vim.treesitter.get_node({ bufnr = bufnr, pos = { row, col } })
  
  if not node then 
    print("Debug: No node found at cursor")
    vim.notify("No treesitter node found at cursor", vim.log.levels.WARN)
    return 
  end
  
  print("Debug: Found node type: " .. node:type())
  
  while node and node:type() ~= "call_expression" do
    node = node:parent()
  end
  
  if not node then 
    print("Debug: No call_expression found")
    vim.notify("No call_expression found in tree", vim.log.levels.WARN)
    return 
  end
  
  print("Debug: Found call_expression")
  
  local function_node = node:named_child(0)
  if not function_node then 
    print("Debug: No function node")
    return 
  end
  
  local function_text = vim.treesitter.get_node_text(function_node, bufnr)
  print("Debug: Function text: " .. function_text)
  
  if not function_text:find("%.catchTags") then 
    print("Debug: Not a catchTags call")
    vim.notify("Not a .catchTags() call", vim.log.levels.WARN)
    return 
  end
  
  print("Debug: This is a catchTags call, proceeding...")
  
  local ls = require("luasnip")
  local s = ls.snippet
  local t = ls.text_node
  local i = ls.insert_node
  
	local function handle_error_types(types)
    print("Debug: Handling error types, count: " .. #types)
    if #types == 0 then 
      vim.notify("No error types found", vim.log.levels.WARN)
      return 
    end
    local object_node = get_object_node_from_call(node)
    if not object_node then 
      print("Debug: No object node found")
      return 
    end
    local start_line, start_col = object_node:start()
    local end_line, end_col = object_node:end_()
    vim.api.nvim_buf_set_text(bufnr, start_line, start_col, end_line, end_col, {})
    
    local nodes = { t("{"), t({ "", "  " }) }  -- Opening brace, newline, indent for first item
    
    for idx, typ in ipairs(types) do
      -- Add the error case
      table.insert(nodes, t(typ .. ": () => Effect.succeed(\""))
      table.insert(nodes, i(idx, ""))
      table.insert(nodes, t("\")"))
      
      -- Add comma and newline for all but the last item
      if idx < #types then
        table.insert(nodes, t({ ",", "  " }))  -- Comma, newline, indent for next item
      else
        table.insert(nodes, t({ "", "" }))  -- Just newline for last item
      end
    end
    
    table.insert(nodes, t("}"))
    
    vim.api.nvim_win_set_cursor(0, { start_line + 1, start_col })
    ls.snip_expand(s("catch_tags_snippet", nodes))
    vim.notify("Effect.catchTags cases generated!", vim.log.levels.INFO)
  end




  query_lsp_hover(bufnr, ts_client, function_node, function(hover_types)
    print("Debug: Got hover types, count: " .. #hover_types)
    if #hover_types > 0 then
      handle_error_types(hover_types)
      vim.lsp.buf.format({ async = true, timeout_ms = 4000 })
    else
      vim.notify("No error types found in hover", vim.log.levels.WARN)
    end
  end)
end

return M
