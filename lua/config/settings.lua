vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.cursorline = true

vim.opt.smartindent = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.clipboard= "unnamedplus"

vim.opt.colorcolumn = ""
vim.keymap.set("n", ";", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- desactive fleche
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')

vim.keymap.set('i', '<Up>', '<Nop>')
vim.keymap.set('i', '<Down>', '<Nop>')
vim.keymap.set('i', '<Left>', '<Nop>')
vim.keymap.set('i', '<Right>', '<Nop>')


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- -- Whitespacle
-- vim.o.list = true
-- vim.o.listchars = 'space:•,tab:» ,lead:•,trail:•'
-- 
-- vim.api.nvim_set_hl(0, 'TrailingWhitespace', { bg='LightRed' })
-- vim.api.nvim_create_autocmd('BufEnter', {
-- 	pattern = '*',
-- 	command = [[
-- 		syntax clear TrailingWhitespace |
-- 		syntax match TrailingWhitespace "\_s\+$"
-- 	]]}
-- )
