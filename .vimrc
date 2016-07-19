" VIM settings for Linux kernel development
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

Plug 'vim-scripts/AutoComplPop'


" Plug 'Valloric/YouCompleteMe'

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


" Add plugins to &runtimepath
call plug#end()

" END OF PLUGINS


" VIM MISC SETINGS

" avoid ESC
imap jj <Esc>


" NERDTREE

" autostart and put cursot in working window
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" autoopen nerdtree in every tab
" exec "nnoremap <silent> <buffer> ". g:NERDTreeMapOpenInTab ." :call <SID>openInNewTab(0)<cr>:NERDTree<cr>"

" tabs

map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>


" TAGBAR

" tagbar toggle with F8
nmap <F8> :TagbarToggle<CR>


" AUTOCOMPLETITION SETTINGS


" OmniCppCompletion plugin

" Enable OmniCompletion
" http://vim.wikia.com/wiki/Omni_completion

filetype plugin on

set omnifunc=syntaxcomplete#Complete

" Configure menu behavior
" http://vim.wikia.com/wiki/VimTip1386

set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" automatically open and close the popup menu / preview window

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Use Ctrl+Space for omni-completion
" http://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim

inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
  \ "\<lt>C-n>" :
  \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
  \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
  \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Popup menu hightLight Group
highlight Pmenu ctermbg=13 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black

" enable global scope search
let OmniCpp_GlobalScopeSearch = 1

" show function parameters
let OmniCpp_ShowPrototypeInAbbr = 1

" show access information in pop-up menu
let OmniCpp_ShowAccess = 1

" auto complete after '.'
let OmniCpp_MayCompleteDot = 1

" auto complete after '->'
let OmniCpp_MayCompleteArrow = 1

" auto complete after '::'
let OmniCpp_MayCompleteScope = 0

" don't select first item in pop-up menu
let OmniCpp_SelectFirstItem = 0


" SET INTENDATION

set tabstop=8
set softtabstop=8
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

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" font size
set guifont=Monospace\ 16

" chosen syntax color
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
set list
set listchars=tab:..

" Highlight trailing spaces
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" more ergonomic normal mode handling
nmap ; :

" COLUMN SETTINGS

set colorcolumn=80

" highlight the last column
highlight ColorColumn ctermbg=darkgray

" POWERLINE

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
"set laststatus=2
"set t_Co=256

"FILETYPE DETECTION

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
