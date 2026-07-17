-- Small quality-of-life plugins adopted from neobean. Delete either block if
-- it gets in your way.
return {
  -- Auto-close brackets/quotes in insert mode
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    opts = {},
  },

  -- sa (add), sd (delete), sr (replace) surroundings
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {},
  },
}
