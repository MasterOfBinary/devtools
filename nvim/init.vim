" Begin plugins
call plug#begin(stdpath('data') . '/plugged')

" NERDtree shows a tree view
Plug 'preservim/nerdtree'

" Lualine for a fast, modern status bar
Plug 'nvim-lualine/lualine.nvim'
" If you want devicons support (optional but recommended)
Plug 'nvim-tree/nvim-web-devicons'

" Awesome colour scheme
Plug 'morhetz/gruvbox'

" Plugin for golang
Plug 'fatih/vim-go'

" Plugin for markdown
Plug 'plasticboy/vim-markdown'

" Additional plugins for better experience
Plug 'tpope/vim-fugitive'           " Git integration
Plug 'airblade/vim-gitgutter'       " Git diff in gutter
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Fuzzy finder
Plug 'junegunn/fzf.vim'             " FZF vim integration
Plug 'tpope/vim-commentary'         " Easy commenting
Plug 'tpope/vim-surround'           " Surround text objects
Plug 'jiangmiao/auto-pairs'         " Auto close brackets
Plug 'lukas-reineke/indent-blankline.nvim'  " Show indent guides

" End plugins
call plug#end()

" Gruvbox stuff
set bg=dark
set termguicolors
colorscheme gruvbox

" For lualine
set laststatus=2
set ttimeoutlen=50

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

" Run golangci-lint when saving (gometalinter is deprecated)
let g:go_metalinter_command = 'golangci-lint'
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'revive', 'errcheck', 'staticcheck', 'unused', 'gosimple', 'ineffassign']

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
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" Use gopls for Go language server
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_referrers_mode = 'gopls'

" Disable vim-go's completion in favor of gopls
let g:go_code_completion_enabled = 0

" Auto format and organize imports on save
let g:go_fmt_autosave = 1
let g:go_imports_autosave = 1
let g:go_mod_fmt_autosave = 1

" Show diagnostic information in quickfix list
let g:go_list_type = 'quickfix'
let g:go_list_height = 10

" Automatically show type info for identifier under cursor
let g:go_auto_sameids = 1

" Set leader to ,
let mapleader = ","

" NERDTree toggle = F2
map <F2> :NERDTreeToggle<CR>

" FZF mappings for better search
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>h :History<CR>

" Quick window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Better split management
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>

" GitGutter settings
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
set updatetime=100

" Turn off cursor line on Debian
set nocursorline

" Set utf-8 encoding
set encoding=utf-8

" Additional visual improvements
set norelativenumber    " Disable relative line numbers
set scrolloff=8         " Keep 8 lines above/below cursor
set sidescrolloff=8     " Keep 8 columns left/right of cursor
set signcolumn=yes      " Always show sign column
set colorcolumn=100     " Show column at 100 characters
set list                " Show invisible characters
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»

" Better search behavior
set ignorecase          " Case insensitive search
set smartcase           " Unless capital letters are used
set inccommand=nosplit  " Live preview of substitutions

" Enable persistent undo
set undofile
set undodir=~/.config/nvim/undodir

" Better completion experience
set completeopt=menuone,noinsert,noselect

" Folding settings - keep everything expanded by default
set nofoldenable        " Disable folding by default
set foldmethod=syntax   " Use syntax-based folding when enabled
set foldlevel=99        " Open all folds by default when folding is enabled

" Markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_frontmatter = 1

" Configure indent-blankline
lua << EOF
require("ibl").setup {
    indent = {
        char = "│",
    },
    scope = {
        enabled = true,
        show_start = true,
        show_end = false,
    },
}
EOF

" Lualine configuration
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
EOF
