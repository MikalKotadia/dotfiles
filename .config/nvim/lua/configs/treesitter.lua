local M = {}

function M.setup()
  local overrides = require "configs.overrides"
  local ts = require "nvim-treesitter"
  local langs = (overrides.treesitter and overrides.treesitter.ensure_installed) or {}

  ts.setup {
    install_dir = vim.fn.stdpath "data" .. "/site",
  }

  if #langs > 0 then
    ts.install(langs)
  end

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
      pcall(vim.treesitter.start, args.buf)
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })
end

return M
