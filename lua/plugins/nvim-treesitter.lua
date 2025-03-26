return {
    'nvim-treesitter/nvim-treesitter',
    build = function()
        local ts_update = require('nvim-treesitter.install').update({
            with_sync = true })
            ts_update()
        end,
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup {
                ensure_installed = { "c", "lua", "markdown_inline", "vim", "vimdoc", "query", "elixir", "ruby", "css", "html" },
                sync_install = false,
                auto_install = true,
                indent = {
                    enable = true
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                }
            }
        end
    }
