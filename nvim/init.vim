" Begin plugins
call plug#begin(stdpath('data') . '/plugged')

" NERDtree shows a tree view
Plug 'preservim/nerdtree'

" Vim-airline for a great status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Awesome colour scheme
Plug 'morhetz/gruvbox'

" Plugin for golang
Plug 'fatih/vim-go'

" Plugin for markdown
Plug 'plasticboy/vim-markdown'

" End plugins
call plug#end()

" Gruvbox stuff
set bg=dark
set termguicolors

" For vim-airline
set laststatus=2
set ttimeoutlen=50
let g:airline_theme='gruvbox'

" Spaces & Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

" UI Config
set number                " show line numbers
set showcmd               " show command in bottom bar
set cursorline            " highlight current line
filetype plugin indent on " load filetype-specific indent and plugin files
set wildmenu              " visual autocomplete for command menu
set lazyredraw            " redraw only when we need to.
set showmatch             " highlight matching [{()}]

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
nnoremap <leader><space> :nohlsearch<CR>
" turn off search highlight with ,<space>

" Automatically write the file when you call :make
set autowrite

" New stuff
set backspace=indent,eol,start
" Make backspace behave in a sane manner.

" Tabs for Go
autocmd Filetype go setlocal ts=4 sw=4 sts=0 noexpandtab

" Jump between errors
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>e <Plug>(go-rename)

" Run goimports when saving
let g:go_fmt_command = "goimports"

" Run gometalinter when saving
let g:go_metalinter_autosave = 1

" Get type info
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1
set updatetime=100

" More highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" Set leader to ,
let mapleader = ","

" NERDTree toggle = F2
map <F2> :NERDTreeToggle<CR>

" Turn off cursor line on Debian
set nocursorline

" Set utf-8 encoding
set encoding=utf-8
