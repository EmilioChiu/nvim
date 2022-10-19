":::instalacion de plugins:::
set encoding=utf-8  	"permite setear la codificación de archivos para aceptar caracteres especiales

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
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
