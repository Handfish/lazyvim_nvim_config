# Handfish LazyVim Configuration 💤

This configuration is built on the [LazyVim](https://www.lazyvim.org/) starter template and has been customized for a productive TypeScript and Rust workflow. This document serves as a personal cheatsheet for the most important custom and default keymaps.

---

## Requirements

I definitely don't remember a full list but the non-obvious ones are:

```
lazygit
bun install -g pretty-ts-errors-markdown
```

### TODO

The `/after` folder may be deprecated at this point but early `.mdx` support with treesitter needed the `.scm` files. Will look into.

Explore [copilot-lsp](https://github.com/copilotlsp-nvim/copilot-lsp) for NES.


## My Custom Keymaps

These are the keymaps I have personally added or changed to fit my specific workflow.

### Editing & Navigation

| Keymap              | Mode          | Description                                           |
| :------------------ | :------------ | :---------------------------------------------------- |
| `<C-j>` / `<C-k>`   | Normal        | Navigate to **Previous** / **Next** Buffer              |
| `<C-n>`             | Normal        | Navigate to the Last Active Buffer                    |
| `<C-;>`             | Normal        | Close Current Buffer                                  |
| `<leader><C-;>`     | Normal        | Force-Close Current Buffer                            |
| `v` + `J`/`K`       | Visual        | Move selected lines up/down                           |
| `<leader>y` / `Y`   | Normal/Visual | Yank to System Clipboard                              |
| `<leader>d`         | Normal/Visual | Delete to Blackhole Register (doesn't overwrite yank) |
| `<leader>s`         | Normal        | Replace word under cursor across the file             |
| `<leader>r`         | Normal        | Toggle Paste Mode                                     |
| `<leader>cx`        | Normal        | Make File Executable (`chmod +x`)                     |

### LSP & Diagnostics

| Keymap              | Mode   | Description                                           |
| :------------------ | :----- | :---------------------------------------------------- |
| `<leader>q`         | Normal | **Toggle Diagnostics** (opens Trouble plugin)         |
| `<leader>0`         | Normal | **Restart LSP** Servers                               |
| `<leader>h`         | Normal | Toggle Inlay Hints                                    |
| `<leader>ic`        | Normal | **Effect: Insert Cases** (custom Effect-TS snippet) |
| `<leader>;`         | Normal | **Rust Code Action**                                  |

### Telescope

| Keymap              | Mode   | Description                         |
| :------------------ | :----- | :---------------------------------- |
| `<C-p>`             | Normal | Find **Git Files**                    |

### Git & Session

| Keymap              | Mode   | Description                         |
| :------------------ | :----- | :---------------------------------- |
| `<leader>2`         | Normal | **CD to Git Root**                    |
| `<leader>3`         | Normal | **Git Add from Root**                 |
| `<leader>q!`        | Normal | **Quit All** windows (`:qa`)        |

### AI (Avante)

 Keymap              | Mode          | Description                         |
| :------------------ | :------------ | :---------------------------------- |
| `<leader>aa`        | Normal/Visual | Ask Avante (AI Assistant)           |
| `<leader>ae`        | Normal/Visual | Edit code with Avante               |
| `<leader>ar`        | Normal        | Refresh Avante response             |
| `<CR>` / `<C-s>`    | Normal/Insert | Submit prompt to Avante (in Avante window) |

### Other Plugins

| Keymap              | Mode   | Plugin    | Description                  |
| :------------------ | :----- | :-------- | :--------------------------- |
| `<leader>e`         | Normal | Oil       | Open File Explorer           |
| `<leader>gg`        | Normal | Lazygit   | Open Lazygit interface       |
| `<leader>gs`        | Normal | Fugitive  | Open Fugitive status window  |
| `<leader>u`         | Normal | Undotree  | Toggle Undotree window       |
| `<leader>bf`        | Normal | Biome     | Format Biome                 |

---
---
---

## Essential LazyVim Defaults

These are some of the most important default keymaps provided by LazyVim and the plugins we've enabled.

### Telescope (Fuzzy Finder)

| Keymap              | Mode   | Description                         |
| :------------------ | :----- | :---------------------------------- |
| `<leader>ff`        | Normal | Find Files (respects `.gitignore`)  |
| `<leader>fg`        | Normal | Live Grep (search for text)         |
| `<leader><space>`   | Normal | Find Buffers (search open files)    |
| `<leader>fh`        | Normal | Find Help Tags                      |

### LSP & Diagnostics

| Keymap              | Mode   | Description                                   |
| :------------------ | :----- | :-------------------------------------------- |
| `gd`                | Normal | Go to Definition                              |
| `gr`                | Normal | Go to References                              |
| `K`                 | Normal | Show Hover Documentation                      |
| `gl`                | Normal | Show Line Diagnostics in a float            |
| `[d` / `]d`          | Normal | Go to Previous/Next Diagnostic                |
| `<leader>xd`        | Normal | Show Document Diagnostics (Trouble)           |
| `<leader>xx`        | Normal | Show Workspace Diagnostics (Trouble)          |
| `<leader>cf`        | Normal | Format Document                               |

### AI (Copilot)

| Keymap              | Mode   | Description                         |
| :------------------ | :----- | :---------------------------------- |
| `<Tab>`             | Insert | **Accept** the current suggestion     |
| `<C-]>`             | Insert | Dismiss the current suggestion      |
| `<M-]>` (Alt+])      | Insert | Show the next suggestion            |
| `<M-[>` (Alt+[)      | Insert | Show the previous suggestion        |

### Debugging (DAP)

| Keymap              | Mode   | Description                         |
| :------------------ | :----- | :---------------------------------- |
| `<F5>`              | Normal | Start/Continue Debugging            |
| `<leader>dB`        | Normal | Toggle Breakpoint                   |
| `<leader>dc`        | Normal | Continue Execution                  |
| `<leader>di`        | Normal | Step Into function                  |
| `<leader>do`        | Normal | Step Out of function                |
| `<leader>dO`        | Normal | Step Over line                      |
