return {
  {
    "L3MON4D3/LuaSnip",
    -- This config function will run AFTER the default setup from the extra.
    -- We just need to add our custom snippets here.
    config = function()
      -- This is the only part we need.
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node

      ls.add_snippets("typescript", {
        s("gg", { t("function* (_) {"), t({ "", "\t" }), i(0), t({ "", "}" }) }),
        s("egg", { t("Effect.gen(function* (_) {"), t({ "", "\t" }), i(0), t({ "", "})" }) }),
        s("yy", { t("yield* _("), i(0), t(")") }),
        s("cyy", { t("const "), i(1), t(" = yield* _("), i(0), t(")") }),
      })
    end,
  },
}
