let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-polyglot/vim-polyglot'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'

call plug#end()

set termguicolors
set background=dark
let g:nord_italic=1
hi Normal guibg=NONE ctermbg=NONE


colorscheme nord
syntax on
set fileformat=unix
set encoding=UTF-8
set nowrap
set list
set signcolumn=yes
set number
set cursorline
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab
set expandtab
set scrolloff=8
"set list
"set listchars=eol:.,tab:>-,trail:~,extends:>,precedes:<

set hlsearch
set incsearch
set mouse=a
set showcmd
set noshowmode
set conceallevel=1
set textwidth=79

" Airline
let g:airline#extensions#tabline#formatter = 'default'
