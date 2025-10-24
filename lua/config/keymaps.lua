-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

pcall(vim.keymap.del, "n", "<CR>")
pcall(vim.keymap.del, "n", "<S-CR>")
pcall(vim.keymap.del, "i", "<C-h>")
pcall(vim.keymap.del, "i", "<C-l>")

-- Normal: add blank lines without entering insert
vim.keymap.set("n", "<CR>", "o<Esc>", { desc = "Add blank line below (normal mode)", silent = true })
vim.keymap.set("n", "<S-CR>", "O<Esc>", { desc = "Add blank line above (normal mode)", silent = true })

-- Insert: cursor left/right
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move cursor left", silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move cursor right", silent = true })

vim.keymap.set({ "n", "v", "x", "s", "i" }, "<C-q>", "<Cmd>confirm qa<CR>", { desc = "Quit All" })
