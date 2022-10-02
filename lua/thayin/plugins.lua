local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Dashboard is a nice start screen for nvim
  use 'goolord/alpha-nvim'

  -- Treesitter --
  use ('nvim-treesitter/nvim-treesitter')

  -- Telescope and related plugins --
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Auto Pairs
  use("windwp/nvim-autopairs")

  -- Buffer Line
  use {'noib3/nvim-cokeline', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

  -- CMP plugins
  use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
  use({ "hrsh7th/cmp-buffer" }) -- buffer completions
  use({ "hrsh7th/cmp-path" }) -- path completions
  use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-nvim-lua" })

  -- Snippets
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")

  -- Colour Schemes
  use("lunarvim/darkplus.nvim")
  use("folke/tokyonight.nvim")

  -- Comments
  use("numToStr/Comment.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- Git Integration
  use("lewis6991/gitsigns.nvim")

  -- Speed up lua plugings
  use("lewis6991/impatient.nvim")
  
  -- Indent blank lines
  use("lukas-reineke/indent-blankline.nvim")

  -- Lua Line
  use("nvim-lualine/lualine.nvim")

  -- Which key
  use("folke/which-key.nvim")

  -- File management --
  use("ahmedkhalf/project.nvim")
  use("kyazdani42/nvim-tree.lua")

  --Toggle Term
  use("akinsho/toggleterm.nvim")

  --[[ -- Syntax Highlighting and Colors -- ]]
  --[[ use 'PotatoesMaster/i3-vim-syntax' ]]
  --[[ use 'kovetskiy/sxhkd-vim' ]]
  --[[ use 'vim-python/python-syntax' ]]
  --[[ use 'ap/vim-css-color' ]]
  --[[]]
  --[[ -- Junegunn Choi Plugins -- ]]
  --[[ use 'junegunn/goyo.vim' ]]
  --[[ use 'junegunn/limelight.vim' ]]
  --[[ use 'junegunn/vim-emoji' ]]

  -- LSP
  use("williamboman/nvim-lsp-installer")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("mfussenegger/nvim-lint")
  use("mhartington/formatter.nvim")
  use("neovim/nvim-lspconfig")

  -- Code Runner
  use {"CRAG666/code_runner.nvim", requires = "nvim-lua/plenary.nvim"}

end)
