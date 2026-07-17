-- Plugin-independent keymaps, carried over from the old remap.lua.
-- Plugin keymaps live in each plugin's spec under lua/vlect/plugins/.
-- NOTE: the Colemak layer in colemak.lua loads after this file and overrides
-- n/e/i/f/k/l/N/E/K/L in normal/visual/operator modes.

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected lines up/down (Colemak-adapted J/K)
vim.keymap.set("v", "U", ":m '<-2<cr>gv=gv")
vim.keymap.set("v", "E", ":m '>+1<cr>gv=gv")

-- Join lines without moving the cursor (the old config had "j" here, which
-- made plain j a no-op — J is what was intended)
vim.keymap.set("n", "J", "mzJ`z")

-- Keep the cursor centered while jumping
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever: paste over selection without losing the register
vim.keymap.set("x", "<leader>p", [["_dp]])

-- next greatest remap ever: yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- this is going to get me cancelled
vim.keymap.set("i", "<c-c>", "<esc>")

vim.keymap.set("n", "q", "<nop>")

-- Requires tmux + tmux-sessionizer on PATH (not installed on this machine yet)
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Quickfix / location list navigation
vim.keymap.set("n", "<c-k>", "<cmd>cnext<cr>zz")
vim.keymap.set("n", "<c-j>", "<cmd>cprev<cr>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<cr>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<cr>zz")

-- Rename word under cursor across the file
vim.keymap.set("n", "<leader>s", [[:%s/\<<c-r><c-w>\>/<c-r><c-w>/gi<left><left><left>]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<cr>", { silent = true })
