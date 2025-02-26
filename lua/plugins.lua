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
    --Copilot
    use 'github/copilot.vim'

    --Snip
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    --Debugger (Dap)
    use {'mfussenegger/nvim-dap', requires = {"suketa/nvim-dap-ruby"}}
    use {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
        "jay-babu/mason-nvim-dap.nvim",
    }
    use 'theHamsta/nvim-dap-virtual-text'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }

    --Tmux
    use 'alexghergh/nvim-tmux-navigation'
    --Terminal
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    --kitty_pet
    use({
        "giusgad/pets.nvim",
        requires = {
            "giusgad/hologram.nvim",
            "MunifTanjim/nui.nvim",
        }
    })

    --dadbod (querys on database)
    use ({
        "tpope/vim-dadbod",
        "kristijanhusak/vim-dadbod-completion",
        "kristijanhusak/vim-dadbod-ui",
    })

    --test in nvim
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "olimorris/neotest-rspec",
            "jfpedroza/neotest-elixir",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        }
    }

    --Themes
    use 'overcache/NeoSolarized'
    use "EdenEast/nightfox.nvim"
    use 'bluz71/vim-nightfly-guicolors'
    use { "catppuccin/nvim", as = "catppuccin" }

    --File-explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    --Statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            "rlch/github-notifications.nvim",
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = { {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-dap.nvim'} }
    }
    use { 'nvim-treesitter/nvim-treesitter', run = function()
        local ts_update = require('nvim-treesitter.install').update({
            with_sync = true }) ts_update()
        end,
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use 'ap/vim-css-color' --Css colors
    use 'elixir-editors/vim-elixir' -- Elixir-highlight

    --harppon
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    -- MD preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    use 'airblade/vim-gitgutter' --Git changes in the file
    use 'tpope/vim-commentary' -- comment with gc motion
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
end)
