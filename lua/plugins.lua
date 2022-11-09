return require('packer').startup(function(use)
    --Plug-mannager
    use 'wbthomason/packer.nvim'

    --Lspconfig
    use {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
    }
    --Autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    --Snip
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    --Terminal
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
	require("toggleterm").setup()
    end}

    --Bar
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

    --Themes
    use 'overcache/NeoSolarized'
    use "EdenEast/nightfox.nvim"
    use 'bluz71/vim-nightfly-guicolors'
    use 'xiyaowong/nvim-transparent'

    --File-explorer
    use {
	'nvim-tree/nvim-tree.lua',
	requires = {
	    'nvim-tree/nvim-web-devicons'
	},
    }
    --Statusline
    use {
	'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Telescope
    use {
	'nvim-telescope/telescope.nvim', tag = '0.1.0',
	requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
	'nvim-treesitter/nvim-treesitter',
	run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use 'ap/vim-css-color' --Css colors
    use 'elixir-editors/vim-elixir' -- Elixir-highlight
    use 'tpope/vim-fugitive' -- Git commands for nvim
    use 'airblade/vim-gitgutter' --Git changes in the file
    use {
	"windwp/nvim-autopairs",
	config = function() require("nvim-autopairs").setup {} end
    }
end)
