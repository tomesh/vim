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

" YCM generator

Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}


"Plug 'Shougo/neocomplcache.vim'

"Plug 'rip-rip/clang_complete'


" HASKELL

" Autocompletition
" Plug 'agletmt/neco-ghc' " problem with getting password github

Plug 'eagletmt/ghcmod-vim'


" C/C++

Plug 'vim-scripts/c.vim'

" C/C++ syntax highlight
Plug 'jeaye/color_coded'


" Add plugins to &runtimepath
call plug#end()

" END OF PLUGIN SETTINGS



" NERDTREE

" autostart and put cursot in working window
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" autoopen nerdtree in every tab
 exec "nnoremap <silent> <buffer> ". g:NERDTreeMapOpenInTab ." :call <SID>openInNewTab(0)<cr>:NERDTree<cr>"

" tabs

map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>


" TAGBAR

" tagbar toggle with F8
nmap <F8> :TagbarToggle<CR>


" AUTOCOMPLETITION SETTINGS

" enable Haskell
let g:ycm_semantic_triggers = {'haskell' : ['.']}

let g:ycm_confirm_extra_conf = 0


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

" SYNTAX, COLORS AND FONTS

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" font size
set guifont=Monospace\ 14

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

" Show spaces used for indenting (so you use only tabs for indenting).
:set list
:set listchars=tab:\|\<Space>


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
