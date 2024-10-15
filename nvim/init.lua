-- Set the local leader key
vim.g.mapleader = " " -- Espace comme touche leader
vim.g.maplocalleader = "\\" -- Touche locale leader
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("source ~/.vimrc")
require("plugins.harpoon")
