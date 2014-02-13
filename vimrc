execute pathogen#infect()

syntax on
filetype plugin indent on

colorscheme molokai
hi clear SignColumn " for gitgutter, nicer looking sign column

" VIM settings
set nocompatible
set notimeout
set ttimeout
set timeoutlen=100
set updatetime=1000

set bs=2
set autoread
set clipboard=unnamed
set ignorecase smartcase
set directory=~/.vim/swp//
set undodir=~/.vim/undo//
set undofile
set noswapfile
set path+=./lib,./spec
set shell=/bin/sh
set swb=useopen
set background=light
set tags+=tags;/,./gems.tags;/,gems.tags;/
set hidden
set backupdir=~/.vim/backup//
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
set wildignore=*.png,*.jpg,*.xcf,*.wav,log/*,tmp/*,coverage/*
set winwidth=80

let mapleader=','
noremap ; :
noremap Y y$
noremap Q <nop>

nnoremap <Leader>w :w<CR>

nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Custom highlighting
hi link TagListFileName Normal
hi Pmenu ctermbg=84

" CoffeeScript settings
au FileType coffee setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" JavaScript settings
au FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" My mappings
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

noremap <C-Down>  <C-W>j
noremap <C-Up>    <C-W>k
noremap <C-Left>  <C-W>h
noremap <C-Right> <C-W>l

nnoremap gp `[v`]

nmap ]t :tnext<CR>
nmap [t :tprev<CR>

nmap <Leader>vv :e ~/.vimrc<CR>
nmap <Leader>vg :e ~/.gvimrc<CR>

" alternate mappings
nnoremap <Leader>a :A<CR>
nnoremap <Leader>va :AV<CR>

" rails mappings
nnoremap <Leader>rm :Rmodel<Space>
nnoremap <Leader>rc :Rcontroller<Space>
nnoremap <Leader>rg :Rgenerate<Space>
nnoremap <Leader>rj :Rjavascript<Space>
nnoremap <Leader>rv :Rview<Space>
nnoremap <Leader>ra :Rake<Space>

" ruby-rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>rs :call RunAllSpecs()<CR>
map <Leader>l :call RunLastSpec()<CR>
let g:rspec_command = "!zeus test -f d {spec}"

" smart home key settings
map <silent> <Home> :SmartHomeKey<CR>
imap <silent> <Home> <C-O>:SmartHomeKey<CR>

" ruby hash
noremap <Leader>rh :Hashrockets<CR>
noremap <Leader>rb :Bashrockets<CR>

" zencoding settings
let g:user_zen_leader_key = '<c-g>'

" ctrlp settings
nmap <Leader>o :CtrlP<CR>
nmap <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = { 'dir': '\v(tmp|coverage|log|public|bin)$' }
let g:ctrlp_reuse_window = 'NERD'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<cr>', '<c-y>', '<2-LeftMouse>'],
    \ 'CreateNewFile()':      []
    \ }

" ag.vim setting
let g:agprg='ag --column --ignore tags --ignore-dir log --ignore-dir tmp --ignore-dir solr'
nnoremap <Leader>* :Ag <cword><CR>

" NERD Tree settings
map <F12> :e %:p:h<CR>
map <leader>n :e %:p:h<CR>

" surround settings
vmap ) s)
vmap ( s(
" vmap " s"
vmap ' s'
vmap { s{
vmap } s}
vmap # s#
nmap s ys

" Fugitive settings
" map <Leader>gs :Gstatus<CR>
" map <Leader>gc :Gcommit<CR>
" map <Leader>gb :Gblame<CR>
" map <Leader>gd :Gdiff<CR>

" Ruby settings
au BufRead,BufNewFile Guardfile,Vagrantfile set ft=ruby
autocmd FileType ruby,eruby,scss,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" JST settings
autocmd FileType jst setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" YAML settings
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" UltiSnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" gundo settings
let g:gundo_width = 60
nnoremap <Leader>u :GundoToggle<CR>

" Local overrides
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
