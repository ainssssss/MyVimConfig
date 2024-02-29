set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rakr/vim-one'
Plugin 'valloric/youcompleteme'
Plugin 'dense-analysis/ale'
Plugin 'ryanoasis/vim-devicons'
"Plugin 'kaicataldo/material'
Plugin 'bryanmylee/vim-colorscheme-icons'
Plugin 'ntk148v/vim-horizon'
Plugin 'rstacruz/vim-closer'
Plugin 'ap/vim-css-color'

call vundle#end()

let g:ale_linters = {
      \ 'python': ['pyright'],
      \ 'javascript': ['tsserver'],
      \ 'typescript': ['tsserver'],
      \ 'c': ['clangd'],
      \ 'cpp': ['clangd'],
	  \ }

let g:ale_lint_delay = 200
let g:ale_enabled = 1
let g:ale_lint_on_text_changed = 1

syntax on

let g:one_allow_italics = 1

colorscheme gruvbox
set background=dark

filetype plugin indent on


au BufNewFile,BufRead *.py
    \ set expandtab | " convierte tab en espacios.
    \ set fileformat=unix

" Ancho en espacios de un tab.
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Indentar automáticamente.=4
set autoindent

" Mostrar número de línea
set number

" Muestra líena debajo del cursor.
set cursorline

" Muestra la pareja de [] {} y ()
set showmatch

" Tamaño por defecto del terminal
set termwinsize=10x0

" encoding
set encoding=utf-8

" Configurando <leader> shortcut
let mapleader = ","

" Keymaps
" =====================================
" Abrir NerdTree
map <C-n> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
"Update NeerdTree
autocmd BufEnter NERD_tree_* | execute 'normal R'


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Saltar al final de la línea
inoremap <C-e> <C-o>$

" Terminal
map <F12> :belowright terminal<CR>

" VimDevIcons
let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1

nnoremap <C-Down> :tabc<CR>

nnoremap <C-Up> :tabnew filename<CR>

nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>

"Plugin Extra Info
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
