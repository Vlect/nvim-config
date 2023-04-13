vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "U", ":m '<-2<cr>gv=gv")
vim.keymap.set("v", "E", ":m '>+1<cr>gv=gv")

vim.keymap.set("n", "j", "mzj`z")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "n", "nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").startvimwithme()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").stopvimwithme()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dp]])

-- next greatest remap ever : asbjornhaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>y", [["+y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- this is going to get me cancelled
vim.keymap.set("i", "<c-c>", "<esc>")

vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<c-k>", "<cmd>cnext<cr>zz")
vim.keymap.set("n", "<c-j>", "<cmd>cprev<cr>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<cr>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<cr>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<c-r><c-w>\>/<c-r><c-w>/gi<left><left><left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<cr>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<cr>");
vim.keymap.set("n", "<leader>mr", "<cmd>cellularautomaton make_it_rain<cr>");

-- new cursor movement (the default arrow keys are used for resizing windows)
vim.keymap.set({ "n", "v" }, "u", "k")
vim.keymap.set({ "n", "v" }, "i", "l")
vim.keymap.set({ "n", "v" }, "e", "j")
vim.keymap.set({ "n", "v" }, "n", "h")

-- Undo operations
vim.keymap.set({ "n", "v" }, "l", "u")
-- Insert Key
vim.keymap.set({ "n", "v" }, "k", "i")
vim.keymap.set({ "n", "v" }, "K", "I")
