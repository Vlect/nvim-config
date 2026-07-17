-- nvim-treesitter main branch (the 2025 rewrite): parsers are installed with
-- require("nvim-treesitter").install() and highlighting is started per-buffer
-- with vim.treesitter.start(). nvim 0.12 already bundles the lua, vim,
-- vimdoc, markdown, c and query parsers.
local ensure_installed = {
  "javascript",
  "typescript",
  "tsx",
  "json",
  "rust",
  "c",
  "lua",
  "vim",
  "vimdoc",
  "markdown",
  "markdown_inline",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").install(ensure_installed)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("vlect-treesitter", { clear = true }),
        callback = function(event)
          local ok = pcall(vim.treesitter.start, event.buf)
          if ok then
            vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
