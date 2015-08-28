let g:python_host_prog='/usr/local/bin/python2.7'

let g:pathogen_disabled = []
if !has('nvim')
	call add(g:pathogen_disabled, 'neoterm')
endif

execute pathogen#infect()

syntax on
filetype plugin indent on

" colorscheme settings
colorscheme molokai
hi clear SignColumn " for gitgutter, nicer looking sign column

" VIM settings
set path+=./lib,./spec
set tags+=tags;/,./gems.tags;/,gems.tags;/

set directory=~/.vim/swp//
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set undofile
set noswapfile

set autoread
set hidden

set wildmenu wildmode=full
set completeopt=longest,menuone
set ignorecase smartcase
set wildignore=*.png,*.jpg,*.xcf,*.wav,log/*,tmp/*,coverage/*,*.gif,*.svg

set laststatus=2
set statusline=%<%f\ %([%Y%M%R%{fugitive#statusline()}]%)%=%-14.(%l,%c%V%)\ %P

set number
set numberwidth=3
set backspace=indent,eol,start
set clipboard=unnamed
set mouse=a

let mapleader=','
let maplocalleader=' '

noremap ; :
noremap Y y$
noremap Q <nop>

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

nnoremap <Leader>w :w<CR>

autocmd VimResized * :wincmd =

" Custom highlighting
hi link TagListFileName Normal
hi PmenuSel ctermfg=15

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

" completion popup behavior tweak
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" alternate mappings
nnoremap <Leader>a :A<CR>
nnoremap <Leader>va :AV<CR>

nnoremap <Leader>cl :ccl<CR>

" rails mappings
nnoremap <Leader>rm :Emodel<Space>
nnoremap <Leader>rc :Econtroller<Space>
nnoremap <Leader>rg :Egenerate<Space>
nnoremap <Leader>rj :Ejavascript<Space>
nnoremap <Leader>rv :Eview<Space>
nnoremap <Leader>ra :Rake<Space>

if has('nvim')
	let test#strategy = "neoterm"
	let test#ruby#rspec#options = {
				\ 'nearest': '-c --no-profile',
				\ 'file':    '-c --no-profile',
				\}
	let test#ruby#rspec#options = {
				\ 'nearest': '-c --no-profile',
				\ 'file':    '-c --no-profile',
				\}
	" let g:neoterm_clear_cmd = "clear; printf '=%.0s' {1..80}; clear"
	let g:neoterm_position = 'vertical'
	nmap <silent> <leader>t :TestFile<CR>
	nmap <silent> <leader>s :TestNearest<CR>
	nmap <silent> <leader>l :TestLast<CR>
else
	" ruby-rspec
	map <Leader>t :call RunCurrentSpecFile()<CR>
	map <Leader>s :call RunNearestSpec()<CR>
	map <Leader>rs :call RunAllSpecs()<CR>
	map <Leader>l :call RunLastSpec()<CR>
endif

let g:rspec_command = "!bundle exec spring rspec -c --no-profile {spec}"

command VanillaRspec let g:rspec_command = "!bundle exec rspec -c --no-profile {spec}"
command SpringRspec let g:rspec_command = "!spring rspec -c --no-profile {spec}"
command SpringRescueRspec let g:rspec_command = "!bundle exec spring rspec --require pry-rescue/rspec --no-profile -c {spec}"

" ruby hash
noremap <Leader>rh :Hashrockets<CR>
noremap <Leader>rb :Bashrockets<CR>

" zencoding settings
let g:user_zen_leader_key = '<c-g>'

" ctrlp settings
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPModified<CR>
let g:ctrlp_custom_ignore = { 'dir': '\v(node_modules|tmp|external|doc|coverage|log|public|bin)$' }
if !has('nvim')
	let g:ctrlp_match_func = { 'match' : 'matcher#cmatch' }
endif
let g:ctrlp_reuse_window = 'NERD\|NEOTERM'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<cr>', '<c-y>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<c-cr>', '<c-s>'],
    \ 'CreateNewFile()':      ['<c-x>'],
    \ 'PrtClearCache()':      ['<c-u>'],
    \ 'PrtClear()':           []
    \ }

" ag.vim setting
let g:agprg='ag --column --ignore tags --ignore-dir log --ignore-dir external --ignore-dir public --ignore-dir tmp --ignore-dir solr'

nnoremap K :Ag '<cword>'<CR>
nnoremap <c-k> :Ag '<cWORD>'<CR>

nnoremap <Leader>* :Ag '<cword>'<CR>
nnoremap <Leader>W* :Ag '<cWORD>'<CR>

vnoremap K "xy:Ag '<c-r>x'<CR>

" NERD Tree settings
map <leader>n :e %:p:h<CR>
let NERDTreeMinimalUI=1

" Ruby settings
au BufRead,BufNewFile Guardfile,Vagrantfile set ft=ruby
autocmd FileType ruby,eruby,scss,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Clojure settings
nnoremap cr :Require<CR>
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['^.*']

" vim-sexp
let g:sexp_enable_insert_mode_mappings = 0

" rainbow parens
au BufRead *.clj,*.cljs RainbowParenthesesActivate
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

" stripper settings
" let g:StripperNoStripOnSave = 0

