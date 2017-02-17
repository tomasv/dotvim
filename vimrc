syntax on
filetype plugin indent on

colorscheme molokai

set autoread
set backspace=indent,eol,start
set backupdir=~/.vim/backup//
set clipboard=unnamed
set completeopt=longest,menuone
set hidden " needed for neovim terminal buffers, otherwise closing window closes terminal process
set incsearch
if has('nvim')
  set inccommand=nosplit
endif
set laststatus=2
set mouse=a
set noequalalways
set noswapfile
set number numberwidth=3
set path+=./lib,./spec
set sessionoptions-=options
set smartcase ignorecase
set statusline=%<%f\ %([%Y%M%R%{NewFileIndicator()}%{fugitive#statusline()}]%)
if has('nvim')
  set statusline+=%{neoterm#test#status('running')}
  set statusline+=%{neoterm#test#status('failed')}
endif
set statusline+=%=%-14.(%l,%c%V%)\ %P
set tags+=tags;
set undofile undodir=~/.vim/undo//
set wildmenu wildmode=full

set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

function NewFileIndicator()
  return filereadable(expand('%:p')) ? '' : ',NEWFILE'
endfunction

let mapleader=','
let maplocalleader=' '

noremap ; :
noremap Y y$
noremap Q <nop>
nnoremap gp `[v`]
nnoremap <Leader>w :w<CR>
nnoremap <Leader>cl :ccl<CR>
nnoremap <Leader>cw :cwindow<CR>
nnoremap <Leader>a :A<CR>
nnoremap <Leader>va :AV<CR>

" completion popup behavior tweak

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" rails mappings

nnoremap <Leader>rm :Emodel<Space>
nnoremap <Leader>rc :Econtroller<Space>
nnoremap <Leader>rg :Egenerate<Space>
nnoremap <Leader>rj :Ejavascript<Space>
nnoremap <Leader>rv :Eview<Space>
nnoremap <Leader>ra :Rake<Space>

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" vim-test

if has('nvim')
  let test#strategy = "neoterm"

  let g:neoterm_position = 'vertical'
  let g:neoterm_run_tests_bg = 1
  let g:neoterm_test_status = { 'running': 'R', 'success': 'S', 'failed': 'F' }
  let g:neoterm_autoinsert = 1

  nmap <silent> <leader>t :call neoterm#test#run('file')<CR>
  nmap <silent> <leader>s :call neoterm#test#run('current')<CR>
  nmap <silent> <leader>l :call neoterm#test#rerun()<CR>
  nmap <silent> <leader>f :Ttoggle<CR>
else
  nmap <silent> <leader>t :TestFile<CR>
  nmap <silent> <leader>s :TestNearest<CR>
  nmap <silent> <leader>l :TestLast<CR>
endif

let g:polyglot_disabled = ['elm']
" ctrlp

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPModified<CR>
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](node_modules|tmp|external|doc|coverage|log)$' }
let g:ctrlp_reuse_window = 'NEOTERM'
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

" Ruby settings

let g:ruby_indent_block_style="do"

" UltiSnips settings

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" vimfiler settings

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_expand_jump_to_first_child = 0
map <leader>n :execute 'VimFiler -find -simple ' . expand('%:p:h')<CR>
autocmd FileType vimfiler map <buffer> u <Plug>(vimfiler_smart_h)
