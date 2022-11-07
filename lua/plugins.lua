return require('packer').startup(function(use)
    --plug-mannager
    use 'wbthomason/packer.nvim'

    --lspconfig
    use {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
    }
    --autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    --snip
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'


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
