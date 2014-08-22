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
set cc=99

let mapleader=','
let maplocalleader=' '
noremap ; :
noremap Y y$
noremap Q <nop>

nnoremap <Leader>w :w<CR>

nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

autocmd VimResized * :wincmd =

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

nmap <Leader>vv :e ~/.vim/vimrc<CR>
nmap <Leader>vg :e ~/.vim/gvimrc<CR>

nnoremap <Leader>rd :redraw!<CR>

" alternate mappings
nnoremap <Leader>a :A<CR>
nnoremap <Leader>va :AV<CR>

nnoremap <Leader>cl :ccl<CR>

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
let g:rspec_command = "!spring rspec -c -f d {spec}"

" smart home key settings
map <silent> <Home> :SmartHomeKey<CR>
imap <silent> <Home> <C-O>:SmartHomeKey<CR>

" ruby hash
noremap <Leader>rh :Hashrockets<CR>
noremap <Leader>rb :Bashrockets<CR>

" zencoding settings
let g:user_zen_leader_key = '<c-g>'

" ctrlp settings
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPModified<CR>
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = { 'dir': '\v(tmp|external|doc|coverage|log|public|bin)$' }
let g:ctrlp_reuse_window = 'NERD'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<cr>', '<c-y>', '<2-LeftMouse>'],
    \ 'CreateNewFile()':      []
    \ }

" ag.vim setting
let g:agprg='ag --column --ignore tags --ignore-dir log --ignore-dir external --ignore-dir public --ignore-dir tmp --ignore-dir solr'
nnoremap <Leader>* :Ag '<cword>'<CR>

" NERD Tree settings
map <F12> :e %:p:h<CR>
map <leader>n :e %:p:h<CR>
let NERDTreeMinimalUI=1

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

" Clojure settings
nnoremap cr :Require<CR>
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['^.*']

" paredit settings
let g:paredit_leader = '<Space>'

" vim-sexp
let g:sexp_enable_insert_mode_mappings = 0

au BufRead *.clj RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

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

" stripper settings
let g:StripperIgnoreFileTypes = [ 'markdown', 'liquid', 'txt', 'conf' ]

" Local overrides
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif

hi ColorColumn ctermbg=0
