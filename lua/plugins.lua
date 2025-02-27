return {
    --Lspconfig
     {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
    },
    --Autocomplete
     'hrsh7th/cmp-nvim-lsp',
     'hrsh7th/cmp-buffer',
     'hrsh7th/cmp-path',
     'hrsh7th/cmp-cmdline',
     'hrsh7th/nvim-cmp',
    --Copilot
     'github/copilot.vim',

    --Snip
     'hrsh7th/cmp-vsnip',
     'hrsh7th/vim-vsnip',

    --Debugger (Dap)
     {'mfussenegger/nvim-dap', dependencies = {"suketa/nvim-dap-ruby"}},
     {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
        "jay-babu/mason-nvim-dap.nvim",
    },
     'theHamsta/nvim-dap-virtual-text',
     { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },

    --Terminal
     {"akinsho/toggleterm.nvim", version = '*', config = function()
        require("toggleterm").setup()
    end},

    --kitty_pet
    {
        "giusgad/pets.nvim",
        dependencies = {
            "giusgad/hologram.nvim",
            "MunifTanjim/nui.nvim",
        }
    },

    --dadbod (querys on database)
     {
        "tpope/vim-dadbod",
        "kristijanhusak/vim-dadbod-completion",
        "kristijanhusak/vim-dadbod-ui",
    },

    --test in nvim
     {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "olimorris/neotest-rspec",
            "jfpedroza/neotest-elixir",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        }
    },

    --Themes
     'overcache/NeoSolarized',
     "EdenEast/nightfox.nvim",
     'bluz71/vim-nightfly-guicolors',

     { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

     'ap/vim-css-color', --Css colors
     'elixir-editors/vim-elixir', -- Elixir-highlight

    -- MD preview
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    { "iamcco/markdown-preview.nvim", build = "cd app && npm install", init = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, },

     'airblade/vim-gitgutter', --Git changes in the file
     'tpope/vim-commentary', -- comment with gc motion
     {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
}
