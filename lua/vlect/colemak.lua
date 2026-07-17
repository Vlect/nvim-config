-- Colemak navigation layer (normal/visual/operator-pending modes).
-- Toggle with vim.g.colemak in lua/vlect/init.lua.
--
-- n/e/i -> j/k/l   movement on the home row
-- f -> e           end of word
-- k/K -> n/N       repeat search (loses the nzzzv centering from keymaps.lua)
-- l/L -> i/I       insert
-- N/E -> 5j/5k     fast vertical movement

if not vim.g.colemak then
  return
end

local function map(lhs, rhs)
  vim.keymap.set("", lhs, rhs, { noremap = true, silent = true })
end

map("n", "j")
map("e", "k")
map("i", "l")
map("f", "e")
map("k", "n")
map("l", "i")
map("K", "N")
map("N", "5j")
map("E", "5k")
map("L", "I")
