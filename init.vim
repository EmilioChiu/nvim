":::instalacion de plugins:::
call plug#begin('~\AppData\Local\nvim\plugged') 	"directorio donde se van a instalar los plugins

"plugins
Plug 'ryanoasis/vim-devicons' 		"icons
Plug 'ap/vim-css-color' 					"css color
Plug 'windwp/nvim-autopairs' 			"close tags
Plug 'yuttie/hydrangea-vim' 			"theme for nvim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "highlighting
Plug 'sheerun/vim-polyglot' 			"highlighting
Plug 'elixir-editors/vim-elixir' 	"highlighting
Plug 'preservim/nerdtree' 				"system explorer
Plug 'nvim-lualine/lualine.nvim'  "status line

call plug#end() 

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"CONFIGURACIONES BASICAS 
set title							"muestra el nombre del archivo en la ventana de la terminal
set number 						"muestra los numeros de cada linea en la parte izquierda 
set relativenumber		"la distribucion de los numeros en lineas de manera relativa
set mouse=a 					"permite la interaccion con el mouse
set noshowmode				"me deja de mostrar el modo en el que estamos
set encoding=utf-8  	"permite setear la codificación de archivos para aceptar caracteres especiales
set sw=4 				 			"la indentación genera 4 espacios
set clipboard=unnamed	"para poder utilizar el portapapeles del sistema operativo 
set colorcolumn=80	  "Muestra la columna límite a 80 caracteres
set nowrap  					"No dividir la línea si es muy larga
set spelllang=en,es   "Corregir palabras usando diccionarios en inglés y español
let mapleader = "," 	"utiliza la coma como tecla lider
syntax enable 				"activa el coloreado de sintaxis en algunos tipos de archivos como html, c, c++

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"configuracion del tema
set termguicolors
colorscheme hydrangea

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"Configuracion de la terminal
set splitright "Abrir nuevo panel hacia la derecha
set splitbelow "Abrir nuevo panel abajo

"Normal mode en la terminal con esc
tnoremap <Esc> <C-\><C-n>

"Empezar terminal en insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

"Abrir terminal con ctrl+n
function! OpenTerminal()
    split term://PowerShell
    resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"Configuracion de NerdTree
let NERDTreeQuitOnOpen = 1 			 "cerrar automaticame despues de abrir un archivo
autocmd VimEnter * NERDTree 		 "Abrir automaticamente
let NERDTreeAutoDeleteBuffer = 1 "borra automaticamente el buffer despues de su eliminacion
let NERDTreeMinimalUI = 1 			 "lo estiliza
let NERDTreeDirArrows = 1     	 "lo estiliza
"Abre con ',v'
nnoremap <Leader>v :NERDTreeToggle<CR> 
"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"Configuracion de Lualine 
lua << END
require("lualine").setup {
		options = {
				theme = "nightfly",
				},
		sections = {
				lualine_a = { "mode" },
				lualine_b = { "filename" },
				lualine_c = { "branch" },
				lualine_x = { "diff" },
				lualine_y = { "encoding" },
				lualine_z = { "location" }
				}
		}
END
