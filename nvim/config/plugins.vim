" [TODO: Redo from scratch]
call plug#begin()
" theme {{{

" Buffers in context line
Plug 'bling/vim-bufferline'              

" Colorschemes {{{
Plug 'embark-theme/vim', {'as': 'embark'}
" }}}

" Lightline {{{
Plug 'itchyny/lightline.vim'
Plug 'macthecadillac/lightline-gitdiff'
Plug 'sainnhe/tmuxline.vim'
" }}}

" }}}

" General {{{

" interactive commands [TODO: CONFIG]
Plug 'Shougo/vimproc.vim', {'do': 'make'}  

Plug 'sheerun/vim-polyglot'

" quick search (s{char}{char} ; ,)
Plug 'justinmk/vim-sneak'  

" file navigation
"Plug 'francoiscabrol/ranger.vim'  

" close buffers w/o closing windows (ranger dep)
"Plug 'rbgrouleff/bclose.vim'      

Plug 'moll/vim-bbye'
" }}}

" ncm2 {{{

" General {{{

" [TODO: Phase out ncm2?]
" In order:
" - Completion;
" - Completion from curent buffers;
" - Completion from other buffers;
" - Completion from paths;
" - Completion from imports;
" - Completion from syntax;
" - Completion from tmux.
Plug 'ncm2/ncm2'                                            
Plug 'ncm2/ncm2-bufword'                                    
Plug 'fgrsnau/ncm2-otherbuf'                                
Plug 'ncm2/ncm2-path'                                       
Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim'  
Plug 'ncm2/ncm2-syntax'     | Plug 'Shougo/neco-syntax'     
Plug 'wellle/tmux-complete.vim'                             

" }}}

" Languages {{{

" Python
Plug 'ncm2/ncm2-jedi'                          

" Rust
Plug 'ncm2/ncm2-racer'                         

" Vimscript
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'  

" completion..?
Plug 'roxma/nvim-yarp'                         

" }}}

" }}}

" git {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" }}}

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'neomake/neomake'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'pdurbin/vim-tsv'
call plug#end()

" plugin config {{{
" bbye
command! -bang -complete=buffer -nargs=? Bclose Bdelete<bang> <args>   " alias Bdelete to Bclose

" ranger
let g:ranger_map_keys = 0                                              " clear mappings
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'  " show hidden files by default

" neomake
call neomake#configure#automake('w')                                   " auto make on write
" }}}
