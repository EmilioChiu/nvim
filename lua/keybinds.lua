local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- cambia los la coma por la tecla líder y el signo de exclamación por el uno
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>wq", ":wq<CR>")
map("n", "<leader>w1", ":w!<CR>")
map("n", "<leader>q1", ":q!<CR>")
map("n", "<leader>wq1", ":wq!<CR>")

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- cambia los la coma por la tecla líder para poder moverse entre buffers
map("n", "<C-o>", ":bn<CR>")
map("n", "<C-i>", ":bp<CR>")
map("n", "<leader>x", ":bp|bd #<CR>") --close the current buffer

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- split windows
map("n", "<leader>ws", "<C-w>s<CR>") -- split window horizontal
map("n", "<leader>wv", "<C-w>v<CR>") -- split window vertical
map("n", "<leader>wc", "<C-w>c<CR>") -- cierra una ventana
map("n", "<leader>wo", "<C-w>o<CR>") -- cierra todas las ventanas excepto la actual

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- new tabs
map("n", "<leader>tN", ":tabnew<CR>")     -- abre una nueva ventana
map("n", "<leader>O", ":tabNext<CR>")     -- se dirije hacia la proxima ventana
map("n", "<leader>I", ":tabprevious<CR>") -- se dirije hacia la ventana anterior

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- usa la tecla líder y una tecla de movimiento para cambiar de pantalla
map("n", "<C-h>", ":wincmd h<CR>")
map("n", "<C-l>", ":wincmd l<CR>")
map("n", "<C-j>", ":wincmd j<CR>")
map("n", "<C-k>", ":wincmd k<CR>")

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- enciende o apaga el check spell de nvim ('z=' para ver opciones)
map("n", "<leader>spl", ":set invspell<CR>")

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- ctr-n para abrir/cerrar nvim-tree
map("n", "<C-n>", ":NvimTreeToggle<CR>")

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- toggle diagnnostic lsp
map("n", "<leader>i", ":DiagnosticToggle<CR>")

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- tests
map("n", "<leader>t ", ':lua require("neotest").run.run()<CR>')                                 --the nearest test
map("n", "<leader>tf", ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>')               -- file test
map("n", "<leader>tD", ':lua require("neotest").run.run(vim.fn.expand("path/to/directory")CR>') -- directory test
map("n", "<leader>tt", ':lua require("neotest").summary.toggle()<CR>')                          -- summary
map("n", "<leader>tw", ':lua require("neotest").watch()<CR>')                                   -- watch
map("n", "<leader>tstoa", ':lua require("neotest").output_panel.toggle()<CR>')
map("n", "<leader>to", ':lua require("neotest").output()<CR>')
