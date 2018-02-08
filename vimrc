
syntax on
filetype plugin indent on

"Editor Display Setup
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-solarized-dark
set nu
set colorcolumn=80
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
set laststatus=2 "Set the statusbar so it always displays
set backspace=2 "Sane backspace behaviour

"Map ctrl+dir keys to move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Map <CR> to clear search highlighting
nnoremap <CR> :noh<CR><CR>

"Set splits to the right and below
set splitbelow
set splitright

"Folding Setup
set foldmethod=indent
set foldlevel=99

"Setup syntax for arduino .ino files
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

"Remove toolbar, menubar and tabbar from gvim
set guioptions-=m
set guioptions-=T 
set guioptions-=e

set guifont=DejaVu_Sans_Mono:h9:cANSI:qDRAFT

