vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- Force transparency after everything loads
local function apply_transparency()
  local groups = {
    "Normal", "NormalFloat", "NormalNC", "SignColumn", 
    "StatusLine", "StatusLineNC", "Folded", "FoldColumn",
    "VertSplit", "NvimTreeNormal", "NvimTreeNormalNC",
    "NvimTreeEndOfBuffer", "NvimTreeWinSeparator",
    "TelescopeNormal", "TelescopeBorder",
    "TabLine", "TabLineFill", "TabLineSel",
    "TbLineBufOn", "TbLineBufOff", "TblineFill", "TbLineBufOnModified",
    "TbBufLineBufOffModified", "TbBufLineBufOnClose", "TbBufLineBufOffClose"
  }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
  end
end

vim.schedule(apply_transparency)

-- Reapply when opening NvimTree
vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  callback = apply_transparency,
})
