local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- cambia los la coma por la tecla líder y el signo de exclamación por el uno
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>q', ':q<CR>')
map('n', '<leader>wq', ':wq<CR>')
map('n', '<leader>w1', ':w!<CR>')
map('n', '<leader>q1', ':q!<CR>')
map('n', '<leader>wq1', ':wq!<CR>')

-- usa la tecla lider con (w) y (s || v) para dividir la pantalla
map('n', '<leader>ws', '<C-w>s<CR>')
map('n', '<leader>wv', '<C-w>v<CR>')

-- usa la tecla líder y una tecla de movimiento para cambiar de pantalla
map('n', '<leader>h', '<C-w>h<CR>')
map('n', '<leader>l', '<C-w>l<CR>')
map('n', '<leader>j', '<C-w>j<CR>')
map('n', '<leader>k', '<C-w>k<CR>')

-- enciende o apaga el check spell de nvim ('z=' para ver opciones)
map('n', '<leader>spl', ':set invspell<CR>')

-- ctr-n para abrir/cerrar nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>')

-- toggle nvim-transparent
map('n', '<leader>tt', ':TransparentToggle<CR>')

-- turn on lsp-notification
map('n', '<leader>on', ':LspStart<CR>')
-- turn off lsp-notification
map('n', '<leader>of', ':LspStop<CR>')

-- tests
map('n', '<leader>tstn', ':lua require("neotest").run.run()<CR>') --the nearest test
map('n', '<leader>tstf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>') -- file test
map('n', '<leader>tstD', ':lua require("neotest").run.run(vim.fn.expand("path/to/directory")CR>') -- directory test
map('n', '<leader>tstt', ':lua require("neotest").summary.toggle()<CR>') -- directory test
map('n', '<leader>tstw', ':lua require("neotest").watch()<CR>') -- directory test
map('n', '<leader>tstoa', ':lua require("neotest").output_panel.toggle()<CR>')
map('n', '<leader>tsto', ':lua require("neotest").output()<CR>')

--test
map('n', '<leader>md', ':MarkdownPreview<CR>')
map('n', '<leader>git', ':Copilot setup<CR>')
