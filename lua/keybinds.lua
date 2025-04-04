local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- cambia los la coma por la tecla líder y el signo de exclamación por el uno
map("n", "<leader>w", ":w<CR>", {desc = "Save current file"})
map("n", "<leader>q", ":q<CR>", {desc = "Quit nvim"})
map("n", "<leader>wq", ":wq<CR>", {desc = "Write and Quit Nvim"})
map("n", "<leader>w1", ":w!<CR>", {desc = "Force Write current file"})
map("n", "<leader>q1", ":q!<CR>", {desc = "Force Quit nvim"})
map("n", "<leader>wq1", ":wq!<CR>", {desc = "Force Write and Quit Nvim"})

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- cambia los la coma por la tecla líder para poder moverse entre buffers
map("n", "<C-o>", ":bn<CR>", {desc = "Next buffer"})
map("n", "<C-i>", ":bp<CR>", {desc = "Previous buffer"})
map("n", "<leader>x", ":bp|bd #<CR>", {desc = "Close current buffer"}) --close the current buffer

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- split windows
map("n", "<leader>ws", "<C-w>s<CR>", {desc = "split window horizontal"}) -- 
map("n", "<leader>wv", "<C-w>v<CR>", {desc = "split window vertical"}) -- 
map("n", "<leader>wc", "<C-w>c<CR>", {desc = "Close a Window"}) -- 
map("n", "<leader>wo", "<C-w>o<CR>", {desc = "Close all Windows except for the current one"}) -- 

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- new tabs
map("n", "<leader>tN", ":tabnew<CR>", {desc = "New tab"})     -- abre una nueva ventana
map("n", "<leader>O", ":tabNext<CR>", {desc = "Next tab"})     -- se dirije hacia la proxima ventana
map("n", "<leader>I", ":tabprevious<CR>", {desc = "Previous tab"}) -- se dirije hacia la ventana anterior

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- usa la tecla líder y una tecla de movimiento para cambiar de pantalla
map("n", "<C-h>", ":wincmd h<CR>")
map("n", "<C-l>", ":wincmd l<CR>")
map("n", "<C-j>", ":wincmd j<CR>")
map("n", "<C-k>", ":wincmd k<CR>")

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- enciende o apaga el check spell de nvim ('z=' para ver opciones)
map("n", "<leader>spl", ":set invspell<CR>", {desc = "Toggle spell check"})

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- ctr-n para abrir/cerrar nvim-tree
map("n", "<C-n>", ":NvimTreeToggle<CR>")

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- toggle diagnnostic lsp
map("n", "<leader>i", ":DiagnosticToggle<CR>")

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- tests
map("n", "<leader>t ", ':lua require("neotest").run.run()<CR>', {desc = "runs the nearest test"})
map("n", "<leader>tf", ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', {desc = "runs all the tests of the current file"})               -- file test
map("n", "<leader>tD", ':lua require("neotest").run.run(vim.fn.expand("path/to/directory")CR>', {desc = "runs all the tests of the current directory"}) -- directory test
map("n", "<leader>tt", ':lua require("neotest").summary.toggle()<CR>', {desc = "toggle the summary tests"})                          -- summary
map("n", "<leader>tw", ':lua require("neotest").watch()<CR>')                                   -- watch
map("n", "<leader>tstoa", ':lua require("neotest").output_panel.toggle()<CR>')
map("n", "<leader>to", ':lua require("neotest").output()<CR>')
--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- probar codigo de lua para nvim
map("n", "<leader><leader>x", "<cmd>source %<CR>", {desc = "Run lua file"})
map("n", "<leader>x",  ":.lua<CR>", {desc = "Run lua line"})
map("v", "<leader>x",  ":lua<CR>", {desc = "Run lua selected line(s)"})
