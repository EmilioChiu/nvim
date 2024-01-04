local g = vim.g
local o = vim.o

-- vim.api.nvim_command('filetype plugin indent on')

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
--CONFIGURACIONES BÁSICAS 
o.title = true               --Muestra el nombre del archivo en la ventana de la terminal
o.number = true              --muestra los números de cada linea en la parte izquierda 
o.relativenumber = true      --la distribución de los números en lineas de manera relativa
o.colorcolumn = "80"         --Muestra la columna límite a 80 caracteres
o.spelllang = "es,en"        --configura el spell check en español y ingles
o.history = 50               --Recuerda las ultimas 50 acciones

-- para identar con espacios
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4

-- Utiliza la coma como tecla líder
g.mapleader = ','
g.maplocalleader = ','

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Better buffer splitting
o.splitright = true o.splitbelow = true
