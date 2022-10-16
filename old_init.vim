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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fzf plug
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocomplete with coc

call plug#end() 

set encoding=utf-8  	"permite setear la codificación de archivos para aceptar caracteres especiales
 				"activa el coloreado de sintaxis en algunos tipos de archivos como html, c, c++

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"Configuracion de la terminal
set splitright "Abrir nuevo panel hacia la derecha
set splitbelow "Abrir nuevo panel abajo

"Normal mode en la terminal con esc
tnoremap <Esc> <C-\><C-n>

"Empezar terminal en insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

"Abrir terminal con ctrl+k
function! OpenTerminal()
		split term://PowerShell
		resize 10
endfunction
nnoremap <C-k> :call OpenTerminal()<CR>

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"Configuracion de NerdTree
let NERDTreeMinimalUI = 1 			 "stlyzed
let NERDTreeDirArrows = 1				 "stlyzed
let NERDTreeShowHidden=1

"cierra si es la unica ventana abierta
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"coc configuration
set updatetime=100
set pumheight=20
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gi <Plug>(coc-implementation)
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"fzf configuration
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }
nnoremap <silent> <C-p> :FZF<CR> 

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
				lualine_x = {'location'},
				lualine_y = {'encoding'},
				lualine_z = { time }
		},
}
END
