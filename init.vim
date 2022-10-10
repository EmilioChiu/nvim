
":::instalacion de plugins:::

call plug#begin('~/AppData\Local\nvim\plugged') 	"directorio donde se van a instalar los plugins

"plugins
Plug 'nvim-lualine/lualine.nvim' 	"barra de estado
Plug 'scrooloose/nerdtree' 		"tree
Plug 'Xuyuanp/nerdtree-git-plugin' 	"tree git plug
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "tree highlight
Plug 'ryanoasis/vim-devicons' 		"icons
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' } "tema
Plug 'neoclide/coc.nvim', {'branch': 'release'} "syntax highlighting
Plug 'mattn/emmet-vim' 			"web dev plug
Plug 'lukas-reineke/indent-blankline.nvim'  
Plug 'Yggdroot/indentLine' 		"indentation
Plug 'ap/vim-css-color' 		"css color
Plug 'windwp/nvim-autopairs' 		"close tags
Plug 'yuttie/hydrangea-vim' 		"theme for nvim
Plug 'kqito/vim-easy-replace' 		"replace
Plug 'sudar/comments.vim' 		"comment plug
Plug 'justinmk/vim-sneak' 		"moverse mas rapido
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } "telescope
Plug 'KadoBOT/nvim-spotify', { 'do': 'make' } "nvim-spotify
Plug 'sheerun/vim-polyglot'
Plug 'elixir-editors/vim-elixir' 	"elixir highlighting
Plug 'tpope/vim-fugitive' 		"git commands in nvim

call plug#end() 			"cerramos el llamado de los plugins

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"configuracion lualine
lua << END
local status = require'nvim-spotify'.status

status:start()
require("lualine").setup {
    options = {
	theme = "nightfly"
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

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"vim-sneak configuracion
let g:sneak#label = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"nvim-autopairs
lua << EOF
require("nvim-autopairs").setup {}
EOF
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"CONFIGURACIONES BASICAS 
set number 				"muestra los numeros de cada linea en la parte izquierda 
set relativenumber 			"la distribucion de los numeros en lineas de manera relativa
set mouse=a 				"permite la interaccion con el mouse
set noshowmode				"me deja de mostrar el modo en el que estamos 'normal, insert, visual, etc'
syntax enable 				"activa el coloreado de sintaxis en algunos tipos de archivos como html, c, c++
set encoding=utf-8 			"permite setear la codificación de archivos para aceptar caracteres especiales
set sw=4 				"la indentación genera 4 espacios
set nowrap				"el texto en una linea no baja a la siguiente, solo continua en la misma hasta el infinito.
"set noswapfile				"para evitar el mensaje que sale al abrir algunos archivos sobre swap.
set clipboard=unnamed			"para poder utilizar el portapapeles del sistema operativo 'esto permite poder copiar y pegar desde cualquier parte a nvim y viceversa.	

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"configuracion del tema
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme hydrangea
"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"Nerd tree configuracion
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"Terminal configuration

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
    split term://PowerShell
    resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"telescope configuration
lua << END
telescope.setup {
    defaults = {
	vimgrep_arguments = {
	    "rg",
	    "--color=never",
	    "--no-heading",
	    "--with-filename",
	    "--line-number",
	    "--column",
	    "--smart-case",
	    },
	prompt_prefix = "   ",
	selection_caret = "  ",
	entry_prefix = "  ",
	initial_mode = "insert",
	selection_strategy = "reset",
	sorting_strategy = "ascending",
	layout_strategy = "horizontal",
	layout_config = {
	    horizontal = {
		prompt_position = "top",
		preview_width = 0.55,
		results_width = 0.8,
		},
	    vertical = {
		mirror = false,
		},
	    width = 0.87,
	    height = 0.80,
	    preview_cutoff = 120,
	    },
	file_sorter = require("telescope.sorters").get_fuzzy_file,
	file_ignore_patterns = {},
	generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
	path_display = { "absolute" },
	winblend = 0,
	border = {},
	borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	color_devicons = true,
	use_less = true,
	set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
	file_previewer = require("telescope.previewers").vim_buffer_cat.new,
	grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
	qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
	-- Developer configurations: Not meant for general override
	buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
    extensions = {
	fzf = {
	    fuzzy = true, -- false will only do exact matching
	    override_generic_sorter = false, -- override the generic sorter
	    override_file_sorter = true, -- override the file sorter
	    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
	    -- the default case_mode is "smart_case"
	    },
	media_files = {
	    filetypes = { "png", "webp", "jpg", "jpeg" },
	    find_cmd = "rg", -- find command (defaults to `fd`)
	    },
	},
    }
END
nmap <C-P> :Telescope git_files hidden=true <CR>
nmap <C-T> :Telescope live_grep <CR>
"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"Coc configuration
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
	    \ coc#pum#visible() ? coc#pum#next(1) :
	    \ CheckBackspace() ? "\<Tab>" :
	    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
	    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

