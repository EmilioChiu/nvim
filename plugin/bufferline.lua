require("bufferline").setup({})

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
	options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function _CLOSE_ALL()
    vim.api.nvim_command(":BufferLineCloseRight")
    vim.api.nvim_command(":BufferLineCloseLeft")
end

map('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>')
map('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>')
map('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>')
map('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>')
map('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>')
map('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>')
map('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>')
map('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>')
map('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>')
map('n', '<leader>$', '<Cmd>BufferLineGoToBuffer -1 <CR>')

-- Move to the next or previous buffer
map('n', '<leader>.', '<Cmd>BufferLineCycleNext<CR>')
map('n', '<leader>,', '<Cmd>BufferLineCyclePrev<CR>')

-- Change position of the buffer
map('n', '<leader>>', '<Cmd>BufferLineMoveNext<CR>')
map('n', '<leader><', '<Cmd>BufferLineMovePrev<CR>')

-- Close all buffers except for the one you're using it
map('n', '<leader>cls', '<Cmd>lua _CLOSE_ALL()<CR>')
