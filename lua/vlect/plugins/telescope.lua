return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- Native fzf sorter: much faster matching (needs make + a C compiler)
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = "Telescope",
    keys = {
      { "<leader>pf", function() require("telescope.builtin").find_files() end, desc = "Find files" },
      { "<C-p>", function() require("telescope.builtin").git_files() end, desc = "Git files" },
      {
        "<leader>ps",
        function()
          require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
        end,
        desc = "Grep string",
      },
      { "<leader>pg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
      { "<leader>vh", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({})
      pcall(telescope.load_extension, "fzf")
    end,
  },
}
