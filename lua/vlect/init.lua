-- Leader must be set before lazy.nvim loads so plugin keymaps land on it
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set to false to disable the Colemak navigation layer (see colemak.lua)
vim.g.colemak = true

require("vlect.options")
require("vlect.keymaps")
require("vlect.colemak")
require("vlect.lazy")

print("Enjoy your coding journey! 🖥⌨🎧")
