vim.g.mapleader = " "

-- Main:
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>t", ":Neotree<CR>")
vim.keymap.set("n", "<leader>g", ":Neotree float git_status<CR>")

-- Terminal:
vim.keymap.set("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>", { noremap = true, silent = true })
