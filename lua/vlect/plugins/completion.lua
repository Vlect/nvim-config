-- blink.cmp replaces the nvim-cmp + lsp-zero completion stack (adopted from
-- neobean). The "default" keymap preset matches the old cmp mappings:
-- <C-n>/<C-p> select, <C-y> accept, <C-space> open the menu.
return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      keymap = { preset = "default" },
      completion = {
        menu = { border = "rounded" },
        documentation = {
          auto_show = true,
          window = { border = "rounded" },
        },
      },
      signature = { enabled = true },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
}
