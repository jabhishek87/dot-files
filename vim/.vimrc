" ========================================
" Options
" ========================================
set number             " Enable line numbers
set relativenumber     " Use relative line numbers
set numberwidth=2      " Number column width
set encoding=UTF-8
set spelllang=en_us,de_de,es_es

" --- Search and Navigation ---
set ignorecase         " Case-insensitive searching
set smartcase          " Case-sensitive if uppercase used
set incsearch          " Show matches as you type
set hlsearch           " Highlight search results
set scrolloff=8        " Keep cursor centered vertically
set mouse=a            " Enable mouse support

" --- Formatting and Tabs ---
set breakindent        " Enable break indent
set wrap               " Wrap long lines visually
set showmatch          " Highlight matching brackets
set undofile           " Save undo history across sessions
set shiftwidth=2       " Spaces per indentation
set tabstop=2          " Spaces per tab
set softtabstop=2      " Spaces per tab during editing ops
set expandtab          " Convert tabs to spaces

" --- Display and Theme ---
if has('termguicolors')
  set termguicolors    " Perfect 24-bit color for Ghostty
endif
syntax on              " Enable code highlighting
set cursorline         " Highlight active line
set signcolumn=auto    " Fix screen-shake during linting


" Save all undo histories centrally instead of cluttering project folders
" run this on installation mkdir -p ~/.vim/undo
if has('persistent_undo')
    set undodir=~/.vim/undo//
    set undofile
endif

