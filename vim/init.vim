call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox
set background=dark
set t_Co=256

set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd

set wildmenu
set wildmode=full

set cursorline
set number
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
nnoremap j gj
nnoremap k gk
syntax enable

set expandtab
set tabstop=2
set shiftwidth=2

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
inoremap <silent> jj <ESC>
