return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs", -- Lazy usará esto si el módulo existe, pero vamos a ser más explícitos
    opts = {
        ensure_installed = {
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "markdown",
            "markdown_inline",
            "elixir",
            "ruby",
            "css",
            "html",
            "latex",
        },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = "<C-s>",
                node_decremental = "<M-space>",
            },
        },
    },
    config = function(_, opts)
        -- En la versión 'main', intentamos cargar el setup si el módulo existe
        -- de lo contrario, Neovim 0.12+ ya maneja mucho de esto
        local status_ok, configs = pcall(require, "nvim-treesitter.configs")
        if status_ok then
            configs.setup(opts)
        end
    end,
}
