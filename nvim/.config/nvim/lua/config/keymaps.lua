vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Dashboard
map("n", "<leader>d", "<cmd>Alpha<CR>")

-- Cheatsheet
map("n", "<leader>?", function()
  vim.cmd("edit ~/.config/nvim/lua/CHEATSHEET.md")
  vim.keymap.set("n", "q", "<cmd>bdelete<CR>", { buffer = true })
end)

-- Better indent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
