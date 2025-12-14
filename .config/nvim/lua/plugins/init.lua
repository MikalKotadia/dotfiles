local overrides = require "configs.overrides"
local llm_providers = require "configs.llm"

---@type NvPluginSpec[]
local plugins = {
  {
    "stevearc/conform.nvim",
    lazy = true,
    ft = vim.tbl_keys(overrides.conform.formatters_by_ft),
    opts = overrides.conform,
  },

  {
    "mfussenegger/nvim-lint",
    lazy = true,
    ft = vim.tbl_keys(overrides.linters_by_ft),
    config = function()
      local lint = require "lint"

      -- Use shared linters
      lint.linters_by_ft = overrides.linters_by_ft

      -- Auto-run linting on save & text change
      vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged", "InsertLeave" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("ts_context_commentstring").setup {
        enable_autocmd = false,
      }
    end,
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup {
        -- pre_hook = function()
        --     return vim.bo.commentstring
        -- end,
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "supermaven-inc/supermaven-nvim",
    lazy = false,
    config = function()
      require("supermaven-nvim").setup {
        keymaps = {
          accept_suggestion = "<C-g>",
        },
      }
    end,
  },
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      local config = require "nvchad.configs.telescope"
      local actions = require "telescope.actions"
      config.defaults.mappings["i"] = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
      require("telescope").setup(config)
    end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup()
      vim.diagnostic.config { virtual_text = false } -- Only if needed in your configuration, if you already have native LSP diagnostics
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
    ft = { "markdown" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("textcase").setup {}
      require("telescope").load_extension "textcase"
    end,
    keys = {
      { "ga", mode = { "n", "x" } },
      { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Text Case Telescope" },
    },
    cmd = {
      "Subs",
      "TextCaseOpenTelescope",
      "TextCaseOpenTelescopeQuickChange",
      "TextCaseOpenTelescopeLSPChange",
      "TextCaseStartReplacingCommand",
    },
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
        per_filetype = {
          ["html"] = {
            enable_close = true,
          },
          ["twig"] = {
            enable_close = true,
          },
        },
      })
    end,
  },
}

return plugins
