local M = {}

function M.setup()
  require("nvim-treesitter-textobjects").setup {
    select = {
      enable = true,
      lookahead = true,
      selection_modes = {
        ["@parameter.outer"] = "v",
        ["@function.outer"] = "V",
        ["@class.outer"] = "V",
      },
      include_surrounding_whitespace = false,
    },
    move = {
      enable = true,
      set_jumps = true,
    },
    swap = {
      enable = true,
    },
    lsp_interop = {
      enable = true,
      border = "rounded",
      floating_preview_opts = {},
    },
  }

  local ts_select = require "nvim-treesitter-textobjects.select"
  local ts_move = require "nvim-treesitter-textobjects.move"
  local ts_swap = require "nvim-treesitter-textobjects.swap"

  local function map(mode, lhs, fn)
    vim.keymap.set(mode, lhs, fn, { silent = true })
  end

  local function select(capture)
    return function()
      ts_select.select_textobject(capture, "textobjects")
    end
  end

  local function next_start(capture)
    return function()
      ts_move.goto_next_start(capture, "textobjects")
    end
  end

  local function next_end(capture)
    return function()
      ts_move.goto_next_end(capture, "textobjects")
    end
  end

  local function prev_start(capture)
    return function()
      ts_move.goto_previous_start(capture, "textobjects")
    end
  end

  local function prev_end(capture)
    return function()
      ts_move.goto_previous_end(capture, "textobjects")
    end
  end

  map({ "x", "o" }, "af", select("@function.outer"))
  map({ "x", "o" }, "if", select("@function.inner"))
  map({ "x", "o" }, "ac", select("@class.outer"))
  map({ "x", "o" }, "ic", select("@class.inner"))
  map({ "x", "o" }, "aa", select("@parameter.outer"))
  map({ "x", "o" }, "ia", select("@parameter.inner"))
  map({ "x", "o" }, "ab", select("@block.outer"))
  map({ "x", "o" }, "ib", select("@block.inner"))
  map({ "x", "o" }, "al", select("@loop.outer"))
  map({ "x", "o" }, "il", select("@loop.inner"))
  map({ "x", "o" }, "ai", select("@conditional.outer"))
  map({ "x", "o" }, "ii", select("@conditional.inner"))

  map({ "n", "x", "o" }, "]f", next_start("@function.outer"))
  map({ "n", "x", "o" }, "]c", next_start("@class.outer"))
  map({ "n", "x", "o" }, "]a", next_start("@parameter.inner"))
  map({ "n", "x", "o" }, "]F", next_end("@function.outer"))
  map({ "n", "x", "o" }, "]C", next_end("@class.outer"))
  map({ "n", "x", "o" }, "]A", next_end("@parameter.inner"))
  map({ "n", "x", "o" }, "[f", prev_start("@function.outer"))
  map({ "n", "x", "o" }, "[c", prev_start("@class.outer"))
  map({ "n", "x", "o" }, "[a", prev_start("@parameter.inner"))
  map({ "n", "x", "o" }, "[F", prev_end("@function.outer"))
  map({ "n", "x", "o" }, "[C", prev_end("@class.outer"))
  map({ "n", "x", "o" }, "[A", prev_end("@parameter.inner"))

  map("n", "<leader>sn", function()
    ts_swap.swap_next("@parameter.inner")
  end)
  map("n", "<leader>sp", function()
    ts_swap.swap_previous("@parameter.inner")
  end)
end

return M
