colorscheme molokai
highlight! link SignColumn LineNr
highlight ALEErrorSign ctermfg=162 ctermbg=234
highlight ALEStyleErrorSign ctermfg=162 ctermbg=234
highlight link ALEInfoSign LineNr
highlight link ALEStyleWarningSign LineNr
highlight link ALEWarningSign LineNr

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
endif

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

if has('terminal')
  tnoremap <Esc> <C-W>N
endif

let g:mapleader=','

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

if has('terminal') || has('nvim')
  let g:test#strategy = 'neoterm'
  let g:neoterm_default_mod = 'rightbelow vertical'
  nmap <silent> <leader>f :Ttoggle<CR>
endif

" fzf
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>m :GFiles?<CR>

let g:fzf_buffers_jump = 1
autocmd! FileType fzf tmap<buffer> <Esc> <C-c>

" ack
nnoremap K :Ack! '<cword>'<CR>
nnoremap <c-k> :Ack! '<cWORD>'<CR>
vnoremap K "xy:Ack! '<c-r>x'<CR>
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case --nobreak'
endif
if executable('rg')
  let g:ackprg = 'rg --sort path --vimgrep --smart-case --no-heading'
endif

" Ruby settings
let g:ruby_indent_block_style='do'

" JavaScript settings
let g:javascript_plugin_flow = 1

" UltiSnips settings
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" defx settings

if has('nvim')
  map <silent> <leader>n :call DefxSmartOpen()<CR>
  nnoremap <silent> - :call DefxSmartOpen()<CR>
else
  map <silent> <leader>n :Explore<CR>
  nnoremap <silent> - :Explore<CR>
endif

function! DefxSmartOpen() abort
  if !empty(defx#get_candidate())
    return
  endif
  let cwd = getcwd()
  let file_path = expand('%:p:h')
  let base_path = match(file_path, cwd) == 0 ? cwd : file_path
  silent! execute 'Defx ' . base_path . ' -new -search=' . expand('%:p')
endfunction

autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
  " Define mappings
  let l:smart_tree_open = "defx#is_directory() ? defx#do_action('open_tree', 'toggle') : defx#do_action('open')"
  execute 'nnoremap <silent><buffer><expr> <CR> ' . l:smart_tree_open
  execute 'nnoremap <silent><buffer><expr> o ' . l:smart_tree_open
  nnoremap <silent><buffer><expr> l defx#do_action('open')
  nnoremap <silent><buffer><expr> O defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> c defx#do_action('copy')
  nnoremap <silent><buffer><expr> m defx#do_action('move')
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  nnoremap <silent><buffer><expr> dd defx#do_action('remove')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  let l:smart_up = "defx#get_candidate()['level'] > 0 ? defx#do_action('close_tree') : defx#do_action('cd', ['..'])"
  execute "nnoremap <silent><buffer><expr> h " . l:smart_up
  execute "nnoremap <silent><buffer><expr> u " . l:smart_up
  execute "nnoremap <silent><buffer><expr> - " . l:smart_up
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <buffer> ; :
endfunction

" splitjoin
nmap <Leader>j :SplitjoinJoin<cr>
nmap <Leader>k :SplitjoinSplit<cr>
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''

" ale
nmap <Leader>cc :ALELint<cr>
nmap <Leader>cf :ALEFix<cr>
let g:ale_enabled = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_set_highlights = 0
let g:ale_fixers = { 'ruby': ['rubocop'], 'javascript': ['eslint'] }

" fugitive mappings
nmap <Leader>gd :Gdiff<cr>
nmap <Leader>ge :Gedit<cr>
