return {
    --Debugger (Dap)
     {'mfussenegger/nvim-dap', dependencies = {"suketa/nvim-dap-ruby"}},
     {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
        "jay-babu/mason-nvim-dap.nvim",
    },
     'theHamsta/nvim-dap-virtual-text',
     { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },

    --Themes
     'overcache/NeoSolarized',
     "EdenEast/nightfox.nvim",
     'bluz71/vim-nightfly-guicolors',

     'ap/vim-css-color', --Css colors

     'airblade/vim-gitgutter', --Git changes in the file
     'tpope/vim-commentary', -- comment with gc motion
}
