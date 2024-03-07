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

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- cambia los la coma por la tecla líder para poder moverse entre buffers
map('n', '<leader>bn', ':bn<CR>')
map('n', '<leader>bp', ':bp<CR>')

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- Paste to clipboard
map('v', '<leader>y', '"+y')
map('n', '<leader>Y', '"+y')

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- split windows
map('n', '<leader>ws', '<C-w>s<CR>') -- split window horizontal
map('n', '<leader>wv', '<C-w>v<CR>') -- split window vertical
map('n', '<leader>wc', '<C-w>c<CR>') -- cierra una ventana
map('n', '<leader>wo', '<C-w>o<CR>') -- cierra todas las ventanas excepto la actual

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- new tabs
map('n', '<leader>tn', ':tabnew') -- abre una nueva ventana
map('n', '<leader>tN', ':tabNext') -- se dirije hacia la proxima ventana
map('n', '<leader>tP', ':tabPrevious') -- se dirije hacia la ventana anterior

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- usa la tecla líder y una tecla de movimiento para cambiar de pantalla
map('n', '<leader>h', '<C-w>h<CR>')
map('n', '<leader>l', '<C-w>l<CR>')
map('n', '<leader>j', '<C-w>j<CR>')
map('n', '<leader>k', '<C-w>k<CR>')

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- enciende o apaga el check spell de nvim ('z=' para ver opciones)
map('n', '<leader>spl', ':set invspell<CR>')

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- ctr-n para abrir/cerrar nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>')

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- toggle nvim-transparent
map('n', '<leader>tt', ':TransparentToggle<CR>')

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- lsp
map('n', '<leader>on', ':LspStart<CR>')-- turn on lsp-notification
map('n', '<leader>of', ':LspStop<CR>')-- turn off lsp-notification

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- tests
map('n', '<leader>tstn', ':lua require("neotest").run.run()<CR>') --the nearest test
map('n', '<leader>tstf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>') -- file test
map('n', '<leader>tstD', ':lua require("neotest").run.run(vim.fn.expand("path/to/directory")CR>') -- directory test
map('n', '<leader>tstt', ':lua require("neotest").summary.toggle()<CR>') -- directory test
map('n', '<leader>tstw', ':lua require("neotest").watch()<CR>') -- directory test
map('n', '<leader>tstoa', ':lua require("neotest").output_panel.toggle()<CR>')
map('n', '<leader>tsto', ':lua require("neotest").output()<CR>')

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
map('n', '<leader>md', ':MarkdownPreview<CR>')-- markdown preview

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
--Copilot-chat todavia no funciona xd
map('n', '<leader>git', ':Copilot setup<CR>')
map('n', '<leader>ccb', '<cmd>CopilotChatBuffer<CR>')
map('n', '<leader>cce', '<cmd>CopilotChatExplain<CR>')
map('n', '<leader>cct', '<cmd>CopilotChatTests<CR>')
map('n', '<leader>ccv', ':CopilotChatVisual<CR>')
map('n', '<leader>ccx', ':CopilotChatInPlace<CR>')
