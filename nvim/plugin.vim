call plug#begin('~/.local/share/nvim/plugged')

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'Shougo/deoplete.nvim'
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'morhetz/gruvbox'
Plug 'easymotion/vim-easymotion'

call plug#end()


" LSP
autocmd BufWritePre *.go call execute(['LspCodeActionSync source.organizeImports', 'LspDocumentFormatSync'])


" Use deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option("auto_complete_delay", 0)
call deoplete#custom#option("auto_complete_start_length", 0)
call deoplete#custom#option("enable_camel_case", 0)
call deoplete#custom#option("enable_ignore_case", 0)
call deoplete#custom#option("enable_refresh_always", 0)
call deoplete#custom#option("enable_smart_case", 1)
call deoplete#custom#option("max_list", 10000)


" vim-go keybind
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)


" easymotion keybind
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-bd-f2)
