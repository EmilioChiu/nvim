return {
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.x',
        dependencies = {
            {
                'nvim-lua/plenary.nvim',
                'nvim-treesitter/nvim-treesitter'
            },
        },
        config = function ()
            require('telescope').setup {
                defaults = {
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                    },
                    prompt_prefix = " 🚀 ",
                    selection_caret = "  ",
                    entry_prefix = "  ",
                    initial_mode = "insert",
                    selection_strategy = "reset",
                    sorting_strategy = "ascending",
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.55,
                            results_width = 0.8,
                        },
                        vertical = {
                            mirror = false,
                        },
                        width = 0.87,
                        height = 0.80,
                        preview_cutoff = 0,
                    },
                    file_sorter = require("telescope.sorters").get_fuzzy_file,
                    file_ignore_patterns = {},
                    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                    path_display = { "absolute" },
                    winblend = 0,
                    border = {},
                    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    color_devicons = true,
                    use_less = true,
                    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                    -- Developer configurations: Not meant for general override
                    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
                },
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                    },
                    media_files = {
                        filetypes = { "png", "webp", "jpg", "jpeg" },
                        find_cmd = "rg", -- find command (defaults to `fd`)
                    }
                }
            }
            builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})  --find file
            vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})   --find word
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})   --find help
            vim.keymap.set('n', '<leader>gc', builtin.git_commits, {}) --git commits
            vim.keymap.set('n', '<leader>gs', builtin.git_status, {})  --git status
        end

    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function ()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
    {
        'nvim-telescope/telescope-dap.nvim',
        config = function ()
            require("telescope").load_extension("dap")
        end
    }
}


