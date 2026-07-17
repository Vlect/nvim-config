# nvim-config

Personal Neovim config (lazy.nvim, standalone — no distro). Migrated from the
old Packer setup in July 2026, adopting practices from linkarzu's neobean
config while keeping the original ThePrimeagen-style keymaps and the Colemak
navigation layer.

Requires Neovim 0.11+ (LSP uses `vim.lsp.config`/`vim.lsp.enable`).

## Layout

```
init.lua                     entry point -> require("vlect")
lua/vlect/init.lua           leader, colemak toggle, module loading order
lua/vlect/options.lua        editor options
lua/vlect/keymaps.lua        plugin-independent keymaps
lua/vlect/colemak.lua        Colemak navigation layer (toggle: vim.g.colemak)
lua/vlect/lazy.lua           lazy.nvim bootstrap + setup
lua/vlect/plugins/*.lua      one spec file per plugin
```

## Stack

- **Plugin manager**: lazy.nvim (replaces Packer)
- **LSP**: nvim-lspconfig + mason (+ lazydev for Lua), replaces lsp-zero
- **Completion**: blink.cmp (replaces nvim-cmp); `<C-y>` accept, `<C-n>/<C-p>` select
- **Formatting**: conform.nvim on `<leader>f` (manual, no format-on-save)
- **Fuzzy finding**: telescope + fzf-native
- **The rest**: harpoon2, treesitter, fugitive + gitsigns, undotree,
  which-key, mini.pairs/surround, lualine, copilot.vim, markdown-preview,
  nvim-dap + dap-ui

## Recommended external tools

```sh
brew install ripgrep fd    # telescope live_grep / find_files
brew install stylua        # lua formatting
npm i -g @fsouza/prettierd # js/ts/json/md formatting (or plain prettier)
```
