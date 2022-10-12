":::instalacion de plugins:::
call plug#begin('~\AppData\Local\nvim\plugged') 	"directorio donde se van a instalar los plugins

"plugins
Plug 'nvim-lualine/lualine.nvim'  							"status line
Plug 'overcache/NeoSolarized' 									"theme for nvim
Plug 'ryanoasis/vim-devicons' 									"icons
Plug 'ap/vim-css-color' 												"css color
Plug 'preservim/nerdtree' 											"nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin' 							"git plug for nerdtree
Plug 'tpope/vim-fugitive/' 											"git comands in nvim
Plug 'airblade/vim-gitgutter' 									"git changes in files
Plug 'sheerun/vim-polyglot' 										"highlighting
Plug 'elixir-editors/vim-elixir' 								"highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "highlighting
Plug 'windwp/nvim-autopairs' 										"close tags

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
syntax enable 				"activa el coloreado de sintaxis en algunos tipos de archivos como html, c, c++

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"Configuraciones personalizadas
let mapleader = "," 	"utiliza la coma como tecla lider

"usa la tecla lider y una tecla de movimiento para cambiar entre pantallas ej ',+l' == ->
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"configuracion del tema
set termguicolors
set background=dark
colorscheme NeoSolarized

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
nnoremap <C-k> :call OpenTerminal()<CR>

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"Configuracion de NerdTree
autocmd VimEnter * NERDTree 		 "abre nerdtree automaticamente
let NERDTreeQuitOnOpen = 1  		 "cierra automaticamente despues de elegir archivo
let NERDTreeAutoDeleteBuffer = 1 "cierra automaticamente el buffer al eliminar un archivo
set modifiable 									 "set modifiable on
let NERDTreeMinimalUI = 1 			 "stlyzed
let NERDTreeDirArrows = 1				 "stlyzed

"abrir nerdtree con ctr-n
nnoremap <silent> <C-n> :NERDTreeToggle<CR> 
"cierra si es la unica ventana abierta
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"lualine configuration
lua << END
local function time()
		local hour = os.date('%H') + 1
		return os.date(hour .. ':%M:%S')
end

require('lualine').setup {
  options = {
    theme = 'nightfly',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'location'},
    lualine_z = { time }
  },
}
END
