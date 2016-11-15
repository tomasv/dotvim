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

function NewFileIndicator()
	if filereadable(expand('%:p'))
		return ''
	end
	return ',NEWFILE'
endfunction

set statusline=%<%f\ %([%Y%M%R%{NewFileIndicator()}%{fugitive#statusline()}]%)%=%-14.(%l,%c%V%)\ %P

set number
set numberwidth=3
set backspace=indent,eol,start
set clipboard=unnamed
set mouse=a

set noea

let mapleader=','
let maplocalleader=' '

noremap ; :
noremap Y y$
noremap Q <nop>

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

nnoremap <Leader>w :w<CR>

" autocmd VimResized * :wincmd =

" Custom highlighting
hi link TagListFileName Normal
hi PmenuSel ctermfg=15

" CoffeeScript settings
au FileType coffee setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" JavaScript settings
au FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" My mappings
nnoremap gp `[v`]

nmap ]t :tnext<CR>
nmap [t :tprev<CR>

nnoremap <Leader>cl :ccl<CR>

" completion popup behavior tweak
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" alternate mappings
nnoremap <Leader>a :A<CR>
nnoremap <Leader>va :AV<CR>

" rails mappings
nnoremap <Leader>rm :Emodel<Space>
nnoremap <Leader>rc :Econtroller<Space>
nnoremap <Leader>rg :Egenerate<Space>
nnoremap <Leader>rj :Ejavascript<Space>
nnoremap <Leader>rv :Eview<Space>
nnoremap <Leader>ra :Rake<Space>

if has('nvim')
	let test#strategy = "neoterm"
endif

let g:neoterm_position = 'vertical'
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>l :TestLast<CR>

" ctrlp settings
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPModified<CR>
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](node_modules|tmp|external|doc|coverage|log|public|bin)$' }
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

" ack.vim setting

if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case --nobreak'
endif

nnoremap K :Ack! '<cword>'<CR>
nnoremap <c-k> :Ack! '<cWORD>'<CR>

nnoremap <Leader>* :Ack! '<cword>'<CR>
nnoremap <Leader>W* :Ack! '<cWORD>'<CR>

vnoremap K "xy:Ack! '<c-r>x'<CR>

" NERD Tree settings
map <leader>n :e %:p:h<CR>
let NERDTreeMinimalUI=1

" Ruby settings
au BufRead,BufNewFile Guardfile,Vagrantfile set ft=ruby
autocmd FileType ruby,eruby,scss,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
let g:ruby_indent_block_style="do"

" JST settings
autocmd FileType jst setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" YAML settings
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" UltiSnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
