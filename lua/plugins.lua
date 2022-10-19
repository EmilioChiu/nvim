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
	    'nvim-tree/nvim-web-devicons', 
	},
    }
    --Statusline
    use {
	'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Soporte LSP
    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}
    use {'neovim/nvim-lspconfig'}

    -- Autocompletado
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
            'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-nvim-lua',
	    'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
	    'f3fora/cmp-spell', 'hrsh7th/cmp-emoji'
	}
    }
    use {
	"windwp/nvim-autopairs",
	config = function() require("nvim-autopairs").setup {} end
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

end)
