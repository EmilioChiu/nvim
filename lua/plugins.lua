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
    use 'ap/vim-css-color' --Css colors
    use 'tpope/vim-fugitive' -- Git commands for nvim
    use 'airblade/vim-gitgutter' --Git changes in the file

end)
