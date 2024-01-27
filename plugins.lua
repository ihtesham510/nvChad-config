local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/schemastore.nvim",
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },

  -- To make a plugin not be loaded
  {
    "NvChad/nvim-colorizer.lua",
    enabled = true,
    opts = overrides.nvim_colorizer,
  },
  {

    "nvim-telescope/telescope.nvim",
    dependencies = {
      "ahmedkhalf/project.nvim",
      config = function()
        require "custom.configs.Project"
      end,
    },
    opts = overrides.telescope,
  },

  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function()
      require "custom.configs.lang.crates"
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    opts = require("custom.configs.lang.rust").opts,
    dependencies = "neovim/nvim-lspconfig",
    ft = "rust",
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "custom.configs.alpha"
    end,
  },
  {
    {
      "lukas-reineke/indent-blankline.nvim",
      dependencies = {
        {
          "echasnovski/mini.indentscope",
          event = "VeryLazy",
          opts = {
            -- symbol = "▏",
            symbol = "│",
            options = { try_as_border = true },
          },
          init = function()
            vim.api.nvim_create_autocmd("FileType", {
              pattern = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "Trouble",
                "trouble",
                "lazy",
                "mason",
                "notify",
                "toggleterm",
                "lazyterm",
              },
              callback = function()
                vim.b.miniindentscope_disable = true
              end,
            })
          end,
        },
      },
      event = "VeryLazy",
      opts = {
        indent = {
          char = "│",
          tab_char = "│",
        },
        scope = { enabled = false },
        exclude = {
          filetypes = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree",
            "Trouble",
            "trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
          },
        },
      },
      main = "ibl",
    },
  },
  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
