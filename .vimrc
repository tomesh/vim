" VIM settings customized for Linux kernel development
" Author: Martin Tomes

" PLUGIN MANAGER SETTIGS( vim-plug)

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'junegunn/vim-easy-align'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " Group dependencies, vim-snippets depends on ultisnips



Plug 'tpope/vim-fireplace'

Plug 'flazz/vim-colorschemes'


" POWERLINE AIRLINE STATUS BAR

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" COMMENTS

Plug 'scrooloose/nerdcommenter'

" GIT SUPPORT

Plug 'tpope/vim-fugitive'

" DISPALY TAGBAR

Plug 'majutsushi/tagbar'

" SURROUND

Plug 'tpope/vim-surround'


" TREE VIEW

Plug 'scrooloose/nerdtree'

" TABS

Plug 'jistr/vim-nerdtree-tabs'


" COMMENTS

Plug 'scrooloose/nerdtree'

" FINDER

Plug 'ctrlpvim/ctrlp.vim'


" SYNTAX CHECKING

Plug 'scrooloose/syntastic'

" LINUX kernel coding style

Plug 'vivien/vim-linux-coding-style'


" AUTOCOMPLETITION

" Plug 'vim-scripts/AutoComplPop'


Plug 'Valloric/YouCompleteMe'

" YCM generator

" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}


"Plug 'Shougo/neocomplcache.vim'

"Plug 'rip-rip/clang_complete'


" HASKELL

" Autocompletition
" Plug 'agletmt/neco-ghc' " problem with getting password github

" Plug 'eagletmt/ghcmod-vim'


" C/C++

Plug 'vim-scripts/c.vim'

" C/C++ syntax highlight
" Plug 'jeaye/color_coded' "problems with compiling (lua)

" MOVING
Plug 'matze/vim-move'

" COPY PASTE
Plug 'NLKNguyen/copy-cut-paste.vim'


" Add plugins to &runtimepath
call plug#end()

" END OF PLUGINS


" VIM MISC SETINGS

" avoid ESC
imap kk <Esc>


" NERDTREE

" autostart and put cursot in working window
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" toggle 
nmap <F5> :NERDTreeToggle<CR>

" size
let g:NERDTreeWinSize=40

" autoopen nerdtree in every tab
" exec "nnoremap <silent> <buffer> ". g:NERDTreeMapOpenInTab ." :call <SID>openInNewTab(0)<cr>:NERDTree<cr>"

" tabs

map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>


" TAGBAR

" tagbar toggle with F8
nmap <F8> :TagbarToggle<CR>


" SET INTENDATION

set autoindent
set tabstop=8
set shiftwidth=8
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

" SYNTAX, COLORS AND FONTS

" chosen syntax color
colorscheme solarized

" go to end/begin of line in insert mode
imap <C-]> <Esc>$a

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" airline color
let g:airline_theme='solarized'

" syntax colors
" C/C++
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" font size
set guifont=Monospace\ 16


set background=dark

set t_Co=256
syntax on

" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */


" Highlight trailing spaces
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" Automatically :write before running commands
set autowrite     

" more ergonomic normal/visual mode handling
nmap ; :
vmap ; :

" use selecting whole lines only
nmap v V

" COLUMN SETTINGS

set colorcolumn=80

" highlight the last column
highlight ColorColumn ctermbg=darkgray

" set swap
set noswapfile
"set swapfile
"set dir=~/tmp

" go to the end of line
inoremap <d-e> <end>
noremap  <d-e> <end>

" matching braces
inoremap {<CR> {<CR>}<C-o>O

" COPY, PASTE, SAVE, CUT, UNDO

" " Copy to clipboard
vnoremap  <c-y>  "+y
nnoremap  <c-Y>  "+yg_
nnoremap  <c-y>  "+y
nnoremap  <c-yy> "+yy

" " Paste from clipboard
nnoremap <c-v> "+p
nnoremap <c-V> "+P
vnoremap <c-V> "+p
vnoremap <c-v> "+P


"Map cmd + S to save in any mode

noremap <silent> <c-S>          :update<CR>
vnoremap <silent> <c-S>         <C-C>:update<CR>
inoremap <silent> <c-S>         <C-O>:update<CR>


" save and close
inoremap <c-q> <Esc> :wqa

" POWERLINE

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
"set laststatus=2
"set t_Co=256

" AUTOCOMPLETITION SETTINGS
filetype plugin on

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

"" turn on completion in comments
let g:ycm_complete_in_comments=1
"" load ycm conf by default
let g:ycm_confirm_extra_conf=0
"" turn on tag completion
let g:ycm_collect_identifiers_from_tags_files=1
"" only show completion as a list instead of a sub-window
set completeopt-=preview
"" start completion from the first character
let g:ycm_min_num_of_chars_for_completion=1
"" don't cache completion items
let g:ycm_cache_omnifunc=0
"" complete syntax keywords
let g:ycm_seed_identifiers_with_syntax=1


" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


"FILETYPE DETECTION

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
