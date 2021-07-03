" [TODO: Update for Neovim 0.5, pretty much redo from scratch at this point]

set nocompatible

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200
set ruler
set showcmd
set wildmenu

" time out for key codes
" wait up to 100ms after Esc for special key
set ttimeout
set ttimeoutlen=100

set display=truncate

" Keep 10 lines of buffer between edges and the cursor when possible.
set scrolloff=10

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

set nrformats-=octal

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  syntax on

  let c_comment_strings=1

  set termguicolors
endif

" =============================================================================
if executable('tmux') && filereadable(expand('~/.bashrc')) && $TMUX !=# ''
  let g:vimIsInTmux = 1
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
else
  let g:vimIsInTmux = 0
endif

runtime! plugins.vim
runtime! general.vim
runtime! statusline.vim
runtime! mappings.vim

if has("autocmd")

  filetype plugin indent on

  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

    " Enable ncm2.
    autocmd BufEnter * call ncm2#enable_for_buffer()

  augroup END

endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif
