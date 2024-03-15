require("toggleterm").setup({
    open_mapping = [[<C-t>]],
    on_open = function ()
	if vim.g.transparent then
	    vim.api.nvim_command(":TransparentDisable")
	end
    end,
    on_close = function ()
	if vim.g.transparent then
	    vim.api.nvim_command(":TransparentEnable")
	end
    end,
    hide_numbers = true,
    start_in_insert = true,
    direction = 'float',
    shell = 'zsh',
    float_opts = {
	border = 'curved',
	width = 85,
	height = 27,
	winblend = 3,
    },
})

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit" })

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gt", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {noremap = true, silent = true})
