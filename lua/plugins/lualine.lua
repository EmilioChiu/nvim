return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        "rlch/github-notifications.nvim",
        'kyazdani42/nvim-web-devicons',
        lazy = true
    },
    opts = {
        options = {
            theme = 'catppuccin',
        },
        sections = {
            lualine_c = {'buffers'},
            lualine_y = {
                {
                    'filename',
                    path = 1
                }
            },
        }}
    }
