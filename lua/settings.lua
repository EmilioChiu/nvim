local g = vim.g
local o = vim.o

-- vim.api.nvim_command('filetype plugin indent on')

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
--CONFIGURACIONES BÁSICAS
o.title = true --Muestra el nombre del archivo en la ventana de la terminal
o.number = true --muestra los números de cada linea en la parte izquierda
o.relativenumber = true --la distribución de los números en lineas de manera relativa
o.colorcolumn = "80" --Muestra la columna límite a 80 caracteres
o.spelllang = "es,en" --configura el spell check en español y ingles
o.history = 50 --Recuerda las ultimas 50 acciones
g.tmux_navigator_no_mappings = 1
vim.api.nvim_set_option("clipboard", "unnamedplus") -- para que el portapapeles funcione en la terminal
vim.cmd([[ set shada=!,'1000,<50,s10,h ]]) --recuerda los ultimos cambios que se hicieron aun si saliste del nvim

-- conf para dark theme
o.termguicolors = true
o.background = "dark"

-- para identar con espacios, separados por lenguaje de programacion
o.expandtab = true

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "ruby",
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "elixir",
	callback = function()
		vim.opt.tabstop = 4
		vim.opt.shiftwidth = 4
	end,
})

-- Utiliza la coma como tecla líder
g.mapleader = ","
g.maplocalleader = ","

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Better buffer splitting
o.splitright = true
o.splitbelow = true
