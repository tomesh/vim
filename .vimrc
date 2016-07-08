" SET INTENDATION

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent

" SET ENCODING
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" SYNTAX

set t_Co=256
syntax on
" colorscheme wombat256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */


" COLUMN SETTINGS

set colorcolumn=110

" highlight the last column
highlight ColorColumn ctermbg=darkgray

"FILETYPE DETECTION

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
