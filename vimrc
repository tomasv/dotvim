colorscheme molokai

set clipboard=unnamed
set completeopt=preview,noselect,menuone
set foldtext=getline(v:foldstart)
set hidden " needed for neovim terminal buffers, otherwise closing window closes terminal process
set mouse=a
set noswapfile
set number numberwidth=3
set smartcase ignorecase

if has('nvim')
  set inccommand=nosplit
  tnoremap <Esc> <C-\><C-n>
endif

let mapleader=','

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

" vim-test
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>l :TestLast<CR>

if has('nvim')
  let test#strategy = "neoterm"
  let g:neoterm_default_mod = 'rightbelow vertical'
  nmap <silent> <leader>f :Ttoggle<CR>
endif

" ctrlp and ack
let g:ctrlp_reuse_window = 'NEOTERM'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<cr>', '<c-y>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<c-cr>', '<c-s>'],
    \ 'PrtClearCache()':      ['<c-u>'],
    \ 'PrtClear()':           []
    \ }

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPModified<CR>

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ackprg = 'ag --vimgrep --smart-case --nobreak'
endif

if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ackprg = 'rg --vimgrep --smart-case --no-heading'
endif

nnoremap K :Ack! '<cword>'<CR>
nnoremap <c-k> :Ack! '<cWORD>'<CR>
vnoremap K "xy:Ack! '<c-r>x'<CR>

" Ruby settings
let g:ruby_indent_block_style="do"

" JavaScript settings
let g:javascript_plugin_flow = 1

" UltiSnips settings
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" vimfiler settings
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_expand_jump_to_first_child = 0
map <leader>n :execute 'VimFilerCreate -find -simple ' . expand('%:p:h')<CR>
autocmd FileType vimfiler map <buffer> u <Plug>(vimfiler_smart_h)

" splitjoin
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nmap <Leader>j :SplitjoinJoin<cr>
nmap <Leader>k :SplitjoinSplit<cr>

" ale
let g:ale_enabled = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 0
let g:ale_set_highlights = 0
let g:ale_fixers = { 'ruby': ['rubocop'], 'javascript': ['eslint'] }

nmap <Leader>cc :ALELint<cr>
nmap <Leader>cf :ALEFix<cr>

" colorscheme tweaks
highlight! link SignColumn LineNr
highlight ALEErrorSign ctermfg=162 ctermbg=234
highlight ALEStyleErrorSign ctermfg=162 ctermbg=234
highlight link ALEInfoSign LineNr
highlight link ALEStyleWarningSign LineNr
highlight link ALEWarningSign LineNr

" fugitive mappings
nmap <Leader>gd :Gdiff<cr>
nmap <Leader>ge :Gedit<cr>
