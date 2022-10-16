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
	    'nvim-tree/nvim-web-devicons', -- optional, for file icons
	},
    }

    --statusline
    use 'nvim-lualine/lualine.nvim'
    use 'ap/vim-css-color'
    --git comands in nvim
    use 'tpope/vim-fugitive' 											
end)
