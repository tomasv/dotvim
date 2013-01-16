execute pathogen#infect()

syntax on
filetype plugin indent on

colorscheme 256-jungle

" VIM settings
set nocompatible
set notimeout
set ttimeout
set timeoutlen=100

set directory=~/.vim/swp
set path+=./lib,./spec
set shell=/bin/sh
set swb=useopen
set background=light
set tags+=tags;/,./gems.tags;/,gems.tags;/
set hidden
set backupdir=~/.vim/backup
set wildmenu wildmode=full
set completeopt=longest,menuone
set laststatus=2
set statusline=%<%f\ %([%Y%M%R%{fugitive#statusline()}]%)%=%-14.(%l,%c%V%)\ %P
set number
set numberwidth=3
set noacd
set showcmd
set tabstop=4
set shiftwidth=4
set noea
set mouse=a
set wildignore=*.png,*.jpg,*.xcf,*.wav

" Custom highlighting
hi link TagListFileName Normal
hi Pmenu ctermbg=84

" CoffeeScript settings
au FileType coffee setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" My mappings
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

noremap <C-Down>  <C-W>j
noremap <C-Up>    <C-W>k
noremap <C-Left>  <C-W>h
noremap <C-Right> <C-W>l

nmap ]t :tnext<CR>
nmap [t :tprev<CR>

nmap <Leader>vv :e ~/.vimrc<CR>
nmap <Leader>vg :e ~/.gvimrc<CR>

nnoremap <Leader>cd :cd %:p:h<CR>

cmap w!! %!sudo tee > /dev/null %

" make popup completion behave more humane
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"

" smart home key settings
map <silent> <Home> :SmartHomeKey<CR>
imap <silent> <Home> <C-O>:SmartHomeKey<CR>

" NERD Tree settings
map <F12> :e %:p:h<CR>

" surround settings
vmap ) s)
vmap ( s(
vmap " s"
vmap ' s'
vmap { s{
vmap } s}
vmap # s#
nmap s ys

" Command-T settings
nmap <Leader>o :CommandTFlush<CR>:CommandT<CR>
let g:CommandTSelectPrevMap=['<C-p>', '<C-k>', '<Esc>OA', '<Up>']
let g:CommandTMaxHeight = 15
let g:CommandTMatchWindowAtTop = 0


" Fugitive settings
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gb :Gblame<CR>
map <Leader>gd :Gdiff<CR>

" Ruby settings
au BufRead,BufNewFile Guardfile,Vagrantfile set ft=ruby
autocmd FileType ruby,eruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

