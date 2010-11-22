" Load plugins
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" VIM settings
set wildmenu wildmode=full
set completeopt=longest,menuone
set laststatus=2
set statusline=%<%f\ %([%Y%M%R%{fugitive#statusline()}]%)%=%-14.(%l,%c%V%)\ %P
set number
set numberwidth=3
set acd
set showcmd
set tabstop=4
set shiftwidth=4
set noea
set mouse=a
set t_ku=OA
set t_kd=OB
set t_kr=OC
set t_kl=OD
syntax on
filetype plugin indent on

" Custom highlighting
hi link TagListFileName Normal
hi Pmenu ctermbg=84

" ObjC settings
au BufRead,BufNewFile *.m setfiletype objc

" My mappings
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

noremap <C-Down>  <C-W>j
noremap <C-Up>    <C-W>k
noremap <C-Left>  <C-W>h
noremap <C-Right> <C-W>l

map <M-Left> :bp<CR>
map <M-Right> :bn<CR>

" make popup completion behave more humane
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"

" miniBufExpl settings
let loaded_minibufexplorer = 1

" smart home key settings
map <Home> :SmartHomeKey<CR>

" delimitMate settings
let loaded_delimitMate = 1
let delimitMate_expand_cr = 0
let delimitMate_expand_space = 0
let delimitMate_balanced_matchpairs = 1
let delimitMate_smart_quotes = 1

" NERD Tree settings
map <F12> :NERDTreeToggle<CR>

" surround settings
vmap ) s)
vmap ( s(
vmap " s"
vmap ' s'
vmap { s{
vmap } s}
vmap # s#

" Command-T settings
map <A-t> :CommandT<CR>

" Fugitive settings
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gb :Gblame<CR>

" Ruby/Rails settings
autocmd FileType ruby,eruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:surround_35 = "#{\r}"
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" ToggleWord settings
map t :ToggleWord<CR>

" FuzzyFinder settings
map <silent> <C-f> :FufFile<CR>
map <silent> <M-f> :FufCoverageFile<CR>

" SuperTab settings
let g:SuperTabDefaultCompletionType="context"
"let g:SuperTabContextDefaultCompletionType="<c-x><c-p>"

" javacomplete settings
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
