" Buffer mappings {{{
nnoremap B   :b
nnoremap Bd  :Bdelete<CR>
nnoremap Bwp :Bwipeout<CR>
nnoremap Bls :ls<CR>
" }}}

" Tab mappings {{{
nnoremap T   :tab
" }}}

" Copy visual selection to clipboard.
vnoremap <C-c> "+y

" Stay in visual mode when changing indentation.
xnoremap < <gv
xnoremap > >gv

" File navigation mappings {{{
" map <leader>f :RangerCurrentFile<CR>
map <leader>f :NERDTreeTabsToggle<CR>
" }}}
