syntax on
filetype plugin indent on

"Editor Display Setup
let base16colorspace=256  " Access colors present in 256 colorspace
set nu
set colorcolumn=120
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
set laststatus=2 "Set the statusbar so it always displays
set backspace=2 "Sane backspace behaviour

"Persist Undo beyond sessions
set undofile
set undodir=~/.vim/undodir

"Add a manual command to re-run ctags
nnoremap <f5> :!ctags -R -f /.tags<CR>
nnoremap <C-F5> :!ctags -R --fields=+l --languages=python --python-kinds=-iv -f .tags ./<CR>

"Map ctrl+dir keys to move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>

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

set background=dark
colorscheme gruvbox

"Remove toolbar, menubar, tabbar and scrollbar from gvim
set guioptions-=m
set guioptions-=T 
set guioptions-=e
set guioptions-=r
set guioptions-=l
set guioptions-=L

"set guifont=DejaVu_Sans_Mono:h9:cANSI:qDRAFT

"From comments here (http://vim.wikia.com/wiki/Project_specific_settings)
"Setup a .vimlocal for local project settings
silent! so .vimlocal

"Automatically save the session into the default name. Do not restore from the
"default name
autocmd VimLeave * mksession! 
" This unfortunately breaks git commit windows. Till I figure out a way to
" filter those out, disabling sourcing the Session of the directory we
" launched from
"silent! so Session.vim

"Setup the terminal debugger
" Use a .vimlocal to set `g:termdebugger` for cross-debugging purposes
packadd termdebug
" Prefer to use the termdebug_config dictionary, but it doesn't seem to work
"set g:termdebug_config['wide']=1
let g:termdebug_wide=1
" Add mapping to move to the program window and close it with <ctrl-\>c.
tnoremap <c-\>c <c-\><c-n>:Program<cr><c-w>:q!<cr>:Gdb<cr>i
" Need to figure out how to handle moving between tabs from terminals

tnoremap <Leader>P <c-\><c-n>:Gdb<cr>i<cr><c-C>load<cr>

" For some reason defaults are getting cleared
hi debugPC term=reverse ctermbg=darkblue guibg=darkblue
hi debugBreakpoint term=reverse ctermbg=red guibg=red

"Setup netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
nnoremap <Leader>dd :15Lexplore %:p:h<CR>
nnoremap <Leader>da :15Lexplore<CR>

"Set grep to ignore tags file
let &grepprg="grep --exclude=tags -n $* /dev/null"

au BufRead,BufNewFile *.vimlocal set filetype=vim
