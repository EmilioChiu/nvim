require("toggleterm").setup({
    open_mapping = [[<C-k>]],
    hide_numbers = true,
    start_in_insert = true,
    direction = 'float',
    shell = 'pwsh',
    float_opts = {
	border = 'curved',
	width = 85,
	height = 27,
	winblend = 3,
    },
})

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {noremap = true, silent = true})
