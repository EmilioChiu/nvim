vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require("nvim-tree").setup({
    open_on_setup = true,
    sort_by = "case_sensitive",
    actions = {
	open_file = {
	    quit_on_open = true,
	},
    },
    view = {
	adaptive_size = true,
	mappings = {
	    list = {
		{ key = "u", action = "dir_up" },
	    },
	},
    },
    renderer = {
	group_empty = true,
    },
})

map('n', '<C-n>', [[:NvimTreeToggle<CR>]]) --"Abrir nerdtree con ctr-n

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- cierra automaticamente cuando es la ultima pantalla
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
  end
})
