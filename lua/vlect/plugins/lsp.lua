-- LSP setup for nvim 0.11+: nvim-lspconfig provides server configs,
-- vim.lsp.config()/vim.lsp.enable() wire them up, mason installs the binaries.
-- This replaces the old lsp-zero setup.
return {
  -- Lua LSP setup for editing this config (successor to neodev.nvim)
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  { "mason-org/mason.nvim", opts = {} },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      -- mason-lspconfig v2 auto-enables every server it installs
      {
        "mason-org/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "ts_ls", "rust_analyzer", "lua_ls" },
        },
      },
    },
    config = function()
      vim.lsp.config("ts_ls", {
        settings = {
          completions = {
            completeFunctionCalls = true,
          },
        },
      })

      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.HINT] = "H",
            [vim.diagnostic.severity.INFO] = "I",
          },
        },
      })

      -- Buffer-local keymaps, carried over from the old lsp.lua
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("vlect-lsp-attach", { clear = true }),
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
          vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
          vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)
          vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)
          vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
          vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
          -- K (hover) is Colemak-remapped; nvim's default K still works when
          -- the Colemak layer is off, otherwise use <leader>vk
          vim.keymap.set("n", "<leader>vk", vim.lsp.buf.hover, opts)
        end,
      })
    end,
  },
}
