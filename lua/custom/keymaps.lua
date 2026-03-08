vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save file" })
vim.keymap.set({ "n", "i", "v" }, "<C-q>", "<cmd>q<CR>", { desc = "Quit" })

vim.keymap.set("n", "<M-j>", "<cmd>move .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<M-k>", "<cmd>move .-2<CR>==", { desc = "Move line up" })

vim.keymap.set("i", "<M-j>", "<Esc><cmd>move .+1<CR>==gi", { desc = "Move line down" })
vim.keymap.set("i", "<M-k>", "<Esc><cmd>move .-2<CR>==gi", { desc = "Move line up" })

vim.keymap.set("v", "<M-j>", ":move '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<M-k>", ":move '<-2<CR>gv=gv", { desc = "Move selection up" })
