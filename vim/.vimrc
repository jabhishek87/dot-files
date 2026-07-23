" ========================================
" Options
" ========================================
set number             " Enable line numbers
set relativenumber     " Use relative line numbers
set numberwidth=2      " Number column width
set encoding=UTF-8
set spelllang=en_us,de_de,es_es
set clipboard=unnamedplus
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

" --- Activate Habamax ---
set background=dark    " Tell Vim you prefer dark backgrounds
colorscheme slate    " Load the built-in Habamax theme

" ========================================
" OSC 52 Clipboard Sync (Fixes SSH Paste)
" ========================================
" This allows Vim to yank and paste directly through SSH into your local clipboard
if has('patch-8.2.3489') || has('nvim')
  set clipboard=unnamedplus
else
  " Fallback for older Vim versions: Stream raw data over the terminal
  function! OSC52Copy(str)
    let b64 = system('base64 | tr -d "\n"', a:str)
    let esc = "\e]52;c;" . b64 . "\x07"
    if !empty($TMUX)
      let esc = "\ePtmux;\e" . esc . "\e\\"
    endif
    call writefile([esc], '/dev/tty', 'b')
  endfunction
  
  augroup osc52
    autocmd!
    autocmd TextYankPost * if v:event.operator is 'y' | call OSC52Copy(join(v:event.regcontents, "\n")) | endif
  augroup END
endif
