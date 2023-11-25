vim.keymap.set("n", "<leader>pv", [[<cmd>Ex<CR>]])

-- Moving in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Yank into clipboard wiht <leader>y
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Pastes and preserves the current paste buffer
vim.keymap.set("x", "<leader>p", [["_dP]])
