require "nvchad.options"

-- add yours here!
--
local opt = vim.opt
-- local autocmd = vim.api.nvim_create_autocmd

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

-- don't add comment on new line
vim.cmd [[autocmd FileType * set formatoptions-=ro]]
