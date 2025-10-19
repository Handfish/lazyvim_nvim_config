# Handfish LazyVim Configuration 💤

This configuration is built on the [LazyVim](https://www.lazyvim.org/) starter template and has been customized for a productive TypeScript and Rust workflow. This document serves as a personal cheatsheet for the most important custom and default keymaps.

---

### TODO

The `/after` folder may be deprecated at this point but early `.mdx` support with treesitter needed the `.scm` files. Will look into.

## Core Keymaps & Navigation

These are the global keymaps available in most buffers for editing and navigation.

### General Editing

| Keymap         | Mode   | Description                                 |
| :------------- | :----- | :------------------------------------------ |
| `<leader>f`    | Normal | Format Document                           |
| `<leader>s`    | Normal | Replace word under cursor across the file   |
| `<leader>cx`   | Normal | Make File Executable (`chmod +x`)           |
| `<leader>r`    | Normal | Toggle Paste Mode                           |
| `v` + `J`/`K`    | Visual | Move selected lines up/down                 |
| `<leader>y`    | Normal/Visual | Yank to System Clipboard                    |
| `<leader>d`    | Normal/Visual | Delete to Blackhole Register (doesn't overwrite yank) |

### Navigation & Buffers

| Keymap         | Mode   | Description                         |
| :------------- | :----- | :---------------------------------- |
| `<C-i>`        | Normal | Go to Previous Buffer               |
| `<C-o>`        | Normal | Go to Next Buffer                   |
| `<C-n>`        | Normal | Go to Last Active Buffer            |
| `<C-;>`        | Normal | Close Current Buffer                |
| `<leader>e`    | Normal | Open File Explorer (Oil) in parent directory |
| `<leader>pv`   | Normal | Open Project Explorer (Netrw)       |

---

## Plugin Keymaps

Keymaps specific to plugins for LSP, Git, Debugging, and more.

### Telescope (Fuzzy Finder)

| Keymap         | Mode   | Description                               |
| :------------- | :----- | :------------------------------------------ |
| `<leader>pf`   | Normal | Find Files (respects `.gitignore`)          |
| `<C-p>`        | Normal | Find Git Files                              |
| `<leader>ps`   | Normal | Grep for a specific string (prompts for input) |
| `<leader>ff`   | Normal | Find Files (LazyVim default)                |
| `<leader>fg`   | Normal | Live Grep (search for text in project)      |
| `<leader><space>`| Normal | Find Buffers (search open files)            |
| `<leader>fh`   | Normal | Find Help Tags                              |

### Language Server Protocol (LSP) & Diagnostics

These keymaps are available when an LSP server is attached to the buffer.

| Keymap         | Mode   | Description                               |
| :------------- | :----- | :------------------------------------------ |
| `gd`           | Normal | Go to Definition                            |
| `gr`           | Normal | Go to References                            |
| `K`            | Normal | Show Hover Documentation                    |
| `gl`           | Normal | Show Line Diagnostics in a float          |
| `[d` / `]d`     | Normal | Go to Previous/Next Diagnostic              |
| `<leader>xd`   | Normal | Show Document Diagnostics (Trouble)         |
| `<leader>xx`   | Normal | Show Workspace Diagnostics (Trouble)        |
| `<leader>q`    | Normal | Toggle Diagnostics (Trouble) - *Your Custom Keymap* |
| `<leader>0`    | Normal | **Restart LSP** - *Your Custom Keymap*      |
| `<leader>h`    | Normal | Toggle Inlay Hints                          |
| `<leader>ic`   | Normal | **Effect: Insert Cases** - *Your Custom Effect-TS snippet* |
| `<leader>;`    | Normal | **Rust Code Action** - *Your Custom Rust keymap* |

### Git Integration

| Keymap         | Mode   | Description                         |
| :------------- | :----- | :---------------------------------- |
| `<leader>gg`   | Normal | Open Lazygit                        |
| `<leader>gs`   | Normal | Open Fugitive Status window         |
| `<leader>2`    | Normal | **CD to Git Root** - *Your Custom Keymap* |
| `<leader>3`    | Normal | **Git Add from Root** - *Your Custom Keymap* |

### AI (Copilot)

Copilot provides multi-line "ghost text" suggestions as you type.

| Keymap         | Mode   | Description                         |
| :------------- | :----- | :---------------------------------- |
| `<Tab>`        | Insert | **Accept** the current suggestion     |
| `<C-]>`        | Insert | Dismiss the current suggestion      |
| `<M-]>` (Alt+]) | Insert | Show the next suggestion            |
| `<M-[>` (Alt+[) | Insert | Show the previous suggestion        |

### Debugging (DAP)

These keymaps are provided by the `dap.core` extra.

| Keymap         | Mode   | Description                         |
| :------------- | :----- | :---------------------------------- |
| `<F5>`         | Normal | Start/Continue Debugging            |
| `<leader>dB`   | Normal | Toggle Breakpoint                   |
| `<leader>dc`   | Normal | Continue Execution                  |
| `<leader>di`   | Normal | Step Into function                  |
| `<leader>do`   | Normal | Step Out of function                |
| `<leader>dO`   | Normal | Step Over line                      |

### Other Plugins

| Keymap            | Mode   | Description                         |
| :---------------- | :----- | :---------------------------------- |
| `<leader>u`       | Normal | Toggle Undotree                     |
| `<leader>a`       | Normal | Harpoon: Add file to list           |
| `<C-e>`           | Normal | Harpoon: Toggle quick menu          |
| `<C-h>`, `<C-t>`, etc. | Normal | Harpoon: Navigate to file 1, 2, etc. |
