vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        filters = {
            dotfiles = false
        },
        sort = {
            sorter = "case_sensitive"
        },
        view = {
            width = 30
        },
        renderer = {
            group_empty = true
        },
        actions = {
            open_file = {
                quit_on_open = true
            }
        }
    }
}
