local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "tpope/vim-commentary",
  },
  {
    "pocco81/auto-save.nvim",
    init = function ()
      require("auto-save").setup()
    end
  },
  {
    'akinsho/toggleterm.nvim',
    config = true,
    init = function()
      require("toggleterm").setup()
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "codelldb",
        "gopls",
        "pyright",
        "mypy",
        "black",
        "isort",
      },
    }
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    opts = {
      name = "env",
    },
	  event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
	  keys = {{
		  "<leader>vs", "<cmd>:VenvSelect<cr>",
	  	"<leader>vc", "<cmd>:VenvSelectCached<cr>"
    }}
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function (_, opts)
      require('rust-tools').setup(opts)
    end
  },
  {
    "folke/neodev.nvim",
    opts = {}
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings("dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    init = function ()
       return require "custom.configs.dap-config"
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    ensure_installed = {
      "codelldb"
    },
    opts = {
      handlers = {}
    },
  },
  {
    "folke/zen-mode.nvim",
    opts = {}
  }
}
return plugins
