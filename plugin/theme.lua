local o = vim.o
o.termguicolors = true
o.background = 'dark'
vim.cmd [[
    syntax enable
    colorscheme NeoSolarized
]]

--Transparent
vim.g.transparent = true
require("transparent").setup({
  enable = vim.g.transparent, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
},
exclude = {}, -- table: groups you don't want to clear
})

vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>TransparentToggle<CR>", {noremap = true, silent = true})
