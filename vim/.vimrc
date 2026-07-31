" === Options ===
set number relativenumber numberwidth=2
set encoding=UTF-8
set clipboard=unnamedplus
set ignorecase smartcase incsearch hlsearch
set scrolloff=8
set mouse=a
set breakindent wrap showmatch
set undofile
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
set signcolumn=auto cursorline

" === Undo directory ===
if has('persistent_undo')
    silent !mkdir -p ~/.vim/undo
    set undodir=~/.vim/undo//
endif

" === Theme ===
if has('termguicolors')
  set termguicolors
endif
syntax on
set background=dark
colorscheme slate

" === OSC 52 clipboard (works over SSH + tmux) ===
if !has('nvim')
  function! OSC52Copy(str)
    let b64 = system('printf "%s" ' . shellescape(a:str) . ' | base64 | tr -d "\n"')
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
