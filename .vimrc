" PLUGIN MANAGER SETTIGS( vim-plug)

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'junegunn/vim-easy-align'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " Group dependencies, vim-snippets depends on ultisnips



Plug 'tpope/vim-fireplace'

Plug 'flazz/vim-colorschemes'


" POWERLINE AIRLINE STATUS BAR

Plug 'vim-airline/vim-airline'


" COMMENTS

Plug 'scrooloose/nerdcommenter'

" GIT SUPPORT

Plug 'tpope/vim-fugitive'

" DISPALY TAGS

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


" AUTOCOMPLETITION

Plug 'Valloric/YouCompleteMe'

"Plug 'Shougo/neocomplcache.vim'

"Plug 'rip-rip/clang_complete'


" HASKELL

" Autocompletition
" Plug 'agletmt/neco-ghc' " problem with getting password github

Plug 'eagletmt/ghcmod-vim'


" C/C++

Plug 'vim-scripts/c.vim'


" Add plugins to &runtimepath
call plug#end()

" END OF PLUGIN SETTINGS



" NERDTREE

" autostart and put cursot in working window
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" autoopen nerdtree in every tab
 exec "nnoremap <silent> <buffer> ". g:NERDTreeMapOpenInTab ." :call <SID>openInNewTab(0)<cr>:NERDTree<cr>"

" TAGBAR

" tagbar toggle with F8
nmap <F8> :TagbarToggle<CR>


" AUTOCOMPLETITION SETTINGS

" enable Haskell
let g:ycm_semantic_triggers = {'haskell' : ['.']}


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

" SYNTAX AND COLORS

" chosen syntax
colorscheme gruvbox

set background=dark

set t_Co=256
syntax on

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

" POWERLINE

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set t_Co=256

"FILETYPE DETECTION

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
