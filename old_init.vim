":::instalacion de plugins:::
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
