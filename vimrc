syntax on
filetype plugin indent on
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'altercation/vim-colors-solarized'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'nvie/vim-flake8'
Plug 'shawncplus/phpcomplete.vim'
Plug 'othree/html5.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug '907th/vim-auto-save'
call plug#end()

" let g:solarized_termcolors = 256
" let g:solarized_visibility = "low"
syntax enable
set background=dark
colorscheme solarized

let g:auto_save = 1
let g:auto_save_silent = 1

" make backspace work like most other apps
set backspace=2


set guifont=Meslo\ LG\ L\ Regular\ for\ Powerline\ Nerd\ Font\ Complete\ 12

autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
set completeopt-=preview


" close vim if the only tab open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" icon mapping for git status on each file
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
" hide some file in NERDTree
let NERDTreeIgnore = ['\.pyc$']


set tabstop=4 " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces


"Open NERDTree with Ctrl-n
map <C-n> :NERDTreeToggle<CR>

set encoding&		" terminal charset: follows current locale
set termencoding=
set fileencodings=	" charset auto-sensing: disabled
set fileencoding&	" auto-sensed charset of current buffer

set ruler
set wildmenu
set syntax=auto
set nu
set ai
set hls
set so=2
set incsearch
set aw
set scrolloff=2
set showtabline=2
set laststatus=2

let mapleader = ";"

map <F2> : <Up><CR>
imap <F3> <Esc> .i
map <F4> :wa <CR>:mksession!<CR>:xa<CR>
map <F5> :s/\(^ *\)/\1#/ <CR>:let @/ = ""<CR>
map <F6> :s/\(^ *\)#/\1/ <CR>:let @/ = ""<CR>
map ù :pu_<CR>
map <tab> >>
map <S-tab> <<
vmap <tab> >gv
vmap <S-tab> <gv
noremap <C-Left> gT
noremap <C-Right> gt
noremap [1;5D gT
noremap [1;5C gt
noremap  :tabnew 
nnoremap <silent> <C-l> :nohl<CR><C-l>
nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr>:nohl<cr><c-o>

let g:xml_syntax_folding=1
map <leader>sf :setlocal spell spelllang=fr<CR>
map <leader>se :setlocal spell spelllang=en_US<CR>


nnoremap <silent> <F8> :TlistToggle<CR>

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

autocmd BufNewFile *.py 0r ~/.vim/skeleton.py
autocmd BufNewFile *.c 0r ~/.vim/skeleton.c
autocmd BufNewFile *.tex 0r ~/.vim/skeleton.tex

autocmd BufWritePost *.php,*.html,*.js,*py silent! !ctags -R 

let g:phpcomplete_mappings = {
  \ 'jump_to_def_vsplit': '<C-D>',
  \ }

"hide passwords when editing
"hi Password ctermfg=black ctermbg=black cterm=NONE guifg=black guibg=black 
"match Password /pass.*\s*=\s*\k\{-}\zs[^ ]*\ze.\{-}/

" swap file location
set directory^=$HOME/.vim/tmp/

set exrc
set secure
