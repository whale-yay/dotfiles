"key binds
let mapleader = ' '
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

nmap <Esc><Esc> :nohlsearch<CR><Esc>

inoremap <silent> jj <ESC>

" file setting
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set wildmenu
set wildmode=full

" search setting
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch


" clipboard
set clipboard+=unnamedplus

" template setting
autocmd BufNewFile docker-compose.yml :0r ~/.config/nvim/template/template.yml

