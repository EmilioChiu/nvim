function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- cambia los dos puntos por la tecla lider y el signo de exclamacion por el uno
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>q', ':q<CR>')
map('n', '<leader>wq', ':wq<CR>')
map('n', '<leader>w1', ':w!<CR>')
map('n', '<leader>q1', ':q!<CR>')
map('n', '<leader>wq1', ':wq!<CR>')

-- usa la tecla lider y una tecla de movimiento para cambiar de pantalla
map('n', '<leader>h', '<C-w>h')
map('n', '<leader>l', '<C-w>l')
map('n', '<leader>j', '<C-w>j')
map('n', '<leader>k', '<C-w>k')
