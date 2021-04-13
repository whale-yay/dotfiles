call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'easymotion/vim-easymotion'
call plug#end()

" easymotion keybind

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-bd-f2)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


" color visual
colorscheme gruvbox
set background=dark
set t_Co=256

" file setting
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set wildmenu
set wildmode=full

" visul setting
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

" tab setting
set expandtab
set tabstop=2
set shiftwidth=2

" search setting
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" jj
inoremap <silent> jj <ESC>
