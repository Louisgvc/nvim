-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
vim.keymap.set("i", "<M-,>", "(", { silent = true })
vim.keymap.set("i", "<M-;>", "[", { silent = true })
vim.keymap.set("i", "<M-:>", "{", { silent = true })

-- Ctrl key mappings
vim.keymap.set("i", "<C-,>", ")", { silent = true })
vim.keymap.set("i", "<C-;>", "]", { silent = true })
vim.keymap.set("i", "<C-:>", "}", { silent = true })
