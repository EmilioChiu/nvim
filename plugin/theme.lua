require("nightfox").setup({})
local o = vim.o
o.termguicolors = true
o.background = 'dark'
vim.cmd [[
    syntax enable
    colorscheme nordfox
]]

--Transparent
vim.g.transparent = true
require("transparent").setup({
  enable = vim.g.transparent,
  extra_groups = {
      "BufferLineTabClose",
      "BufferlineBufferSelected",
      "BufferLineFill",
      "BufferLineBackground",
      "BufferLineSeparator",
      "BufferLineIndicatorSelected",
  },
})

-- On and off the transparent theme
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>TransparentToggle<CR>", {noremap = true, silent = true})
