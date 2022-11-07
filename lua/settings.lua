local g = vim.g
local o = vim.o

-- vim.api.nvim_command('filetype plugin indent on')

--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
--CONFIGURACIONES BASICAS 
o.title = true               --Muestra el nombre del archivo en la ventana de la terminal
o.number = true              --muestra los numeros de cada linea en la parte izquierda 
o.relativenumber = true      --la distribucion de los numeros en lineas de manera relativa
o.noshowmode = true          --me deja de mostrar el modo en el que estamos
o.sw = 4                     --la indentación genera 4 espacios
o.colorcolumn = "80"         --Muestra la columna límite a 80 caracteres
o.nowrap = true              --No dividir la línea si es muy larga
o.spelllang = 'en'            --Corregir palabras usando diccionarios en inglés y español
o.history = 50               --Recuerda las ultimas 50 acciones

-- Utiliza la coma como tecla lider
g.mapleader = ','
g.maplocalleader = ','

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Better buffer splitting
o.splitright = true
o.splitbelow = true
