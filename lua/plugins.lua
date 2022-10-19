return require('packer').startup(function(use)
    --plug-mannager
    use 'wbthomason/packer.nvim'

    --themes
    use 'overcache/NeoSolarized'
    use 'bluz71/vim-nightfly-guicolors'
    --file-explorer
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

    --LSP
    use {
	'VonHeikemen/lsp-zero.nvim',
	requires = {
	    -- Soporte LSP
	    {'neovim/nvim-lspconfig'},
	    {'williamboman/mason.nvim'},
	    {'williamboman/mason-lspconfig.nvim'},

	    -- Autocompletado
	    {'hrsh7th/nvim-cmp'},
	    {'hrsh7th/cmp-buffer'},
	    {'hrsh7th/cmp-path'},
	    {'saadparwaiz1/cmp_luasnip'},
	    {'hrsh7th/cmp-nvim-lsp'},
	    {'hrsh7th/cmp-nvim-lua'},

	    -- Snippets
	    {'L3MON4D3/LuaSnip'},
	    {'rafamadriz/friendly-snippets'},
	}
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
    use 'tpope/vim-fugitive' -- Git commands for nvim
    use 'airblade/vim-gitgutter' --Git changes in the file
    use {
	"windwp/nvim-autopairs",
	config = function() require("nvim-autopairs").setup {} end
    }
end)
