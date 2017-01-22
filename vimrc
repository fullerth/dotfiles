
syntax on
filetype plugin indent on

inoremap jk <ESC>

"Editor Display Setup
colorscheme evening
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

"Macro for clearing data out of a WatchTape Json video data file
let @j = '5f"ldt"3f"ldt"j0'

"Setup syntax for arduino .ino files
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

"Add Apprentice Theme to the runtimepath
set runtimepath+=~/.vim/bundle/Apprentice

"Add vim-markdown-preview to the runtimepath
let vim_markdown_preview_github=1
set runtimepath+=~/.vim/bundle/vim-markdown-preview
set runtimepath+=~/.vim/bundle/nerdcommenter

colorscheme apprentice
