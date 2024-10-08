local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "nvim-tree/nvim-tree.lua"
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use "moll/vim-bbye" -- Close buffer without closing window
  use "nvim-lualine/lualine.nvim"
  use {
    "akinsho/toggleterm.nvim", tag = 'v2.*'
  }
  use "ahmedkhalf/project.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  use "aserowy/tmux.nvim"
  use "folke/todo-comments.nvim"
  -- use "christoomey/vim-tmux-navigator"

  -- Colorschemes
  use "lunarvim/darkplus.nvim"
  use "projekt0n/github-nvim-theme"
  use "ful1e5/onedark.nvim"
  use "Mofiqul/dracula.nvim"
  use "doums/darcula"
  use "EdenEast/nightfox.nvim"
  use "savq/melange"
  use "sainnhe/edge"
  use "sainnhe/everforest"
  use "sainnhe/sonokai"
  use "NLKNguyen/papercolor-theme"
  use "folke/tokyonight.nvim"
  use "mhartington/oceanic-next"
  use "ayu-theme/ayu-vim"
  use "cocopon/iceberg.vim"
  use "rebelot/kanagawa.nvim"
  use "catppuccin/nvim"
  use "AlexvZyl/nordic.nvim"
  use { "luisiacc/gruvbox-baby", branch = 'main' }
  use "nyoom-engineering/oxocarbon.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use "neovim/nvim-lspconfig" -- enable LSP
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "folke/trouble.nvim"
  use {
    "ionide/Ionide-vim",
    run = "make fsautocomplete",
  }
  use {'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }}
  use "simrat39/rust-tools.nvim"
  use "github/copilot.vim"

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.1"
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "kdheepak/lazygit.nvim"
  use "lewis6991/gitsigns.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
