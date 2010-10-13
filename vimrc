
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

"au BufWritePost *.c,*.cpp,*.h silent! !ctags . &
"au BufWritePost *.c,*.cpp,*.h TlistUpdate
au BufRead,BufNewFile *.m setfiletype objc

let g:proj_flags = 'imst'
let g:EclimNailgunClient = 'external'

"disable minibufexpl
let loaded_minibufexplorer = 1
let loaded_nerd_comments = 1
"disable delimitMate
let loaded_autotag = 1
let loaded_delimitMate = 1
let delimitMate_expand_cr = 1

"set term=builtin_xterm
set ls=2
set statusline=%<%f\ %([%Y%M%R%{fugitive#statusline()}]%)%=%-14.(%l,%c%V%)\ %P

set number
set numberwidth=3
set acd
set showcmd

set tabstop=4
set shiftwidth=4

set noea

"nnoremap + <C-W>+
"nnoremap - <C-W>-
"nnoremap _ <C-W>-

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set t_ku=OA
set t_kd=OB
set t_kr=OC
set t_kl=OD

" Ruby
autocmd FileType ruby,eruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:surround_35 = "#{\r}"
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

"map <F5> :make<CR><CR>:copen 8<CR><C-W>W
"map <F6> :cp<CR>
"map <F7> :cn<CR>
"map <C-F12> :TlistToggle<CR>
map <F12> :NERDTreeToggle<CR>

map <F8> :!ctags -R .<CR>
"set tags=tags;/
map t :ToggleWord<CR>
map <silent> <C-f> :FufFile<CR>
map <silent> <M-f> :FufCoverageFile<CR>

noremap <C-Down>  <C-W>j
noremap <C-Up>    <C-W>k
noremap <C-Left>  <C-W>h
noremap <C-Right> <C-W>l

map <M-Left> :bp<CR>
map <M-Right> :bn<CR>

syntax on
filetype plugin indent on

hi link TagListFileName Normal
hi Pmenu ctermbg=80

set mouse=a

let g:SuperTabDefaultCompletionType="context"
"let g:SuperTabContextDefaultCompletionType="<c-x><c-p>"
"
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

if has("autocmd")
	autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

vmap ) s)
vmap ( s(
vmap " s"
vmap ' s'
vmap { s{
vmap } s}
vmap # s#

map <A-t> :CommandT<CR>

map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gb :Gblame<CR>
