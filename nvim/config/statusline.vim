function! Tab_num(n) abort
  return a:n." \ue0bb "
endfunction

" Linghtline config
let g:lightline = {}

let g:lightline.colorscheme = 'embark'

let g:lightline.separator =    { 'left': "\ue0b8 ", 'right': "\ue0be " }
let g:lightline.subseparator = { 'left': "\ue0b9 ", 'right': "\ue0b9 " }
let g:lightline.active = {
  \ 'left':  [ [ 'mode', 'paste' ],
  \            [ 'readonly', 'filename', 'modified', 'fileformat', 'devicons_filetype' ] ],
  \ 'right': [ [ 'lineinfo' ],
  \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'pomodoro' ],
  \            [ 'asyncrun_status', 'coc_status' ] ]
  \ }
let g:lightline.inactive = {
  \ 'left':  [ [ 'filename' , 'modified', 'fileformat', 'devicons_filetype' ]],
  \ 'right': [ [ 'lineinfo' ] ]
  \ }

let g:lightline.component = {
  \ 'gitstatus' :   '%{lightline_gitdiff#get_status()}',
  \ 'bufinfo':      '%{bufname("%")}:%{bufnr("%")}',
  \ 'vim_logo':     "\ue7c5",
  \ 'mode':         '%{lightline#mode()}',
  \ 'absolutepath': '%F',
  \ 'relativepath': '%f',
  \ 'filename':     '%t',
  \ 'filesize':     "%{HumanSize(line2byte('$') + len(getline('$')))}",
  \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
  \ 'fileformat':   '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
  \ 'filetype':     '%{&ft!=#""?&ft:"no ft"}',
  \ 'modified':     '%M',
  \ 'bufnum':       '%n',
  \ 'paste':        '%{&paste?"PASTE":""}',
  \ 'readonly':     '%R',
  \ 'charvalue':    '%b',
  \ 'charvaluehex': '%B',
  \ 'percent':      '%2p%%',
  \ 'percentwin':   '%P',
  \ 'spell':        '%{&spell?&spelllang:""}',
  \ 'lineinfo':     '%2p%% %3l:%-2v',
  \ 'line':         '%l',
  \ 'column':       '%c',
  \ 'close':        '%999X X ',
  \ 'winnr':        '%{winnr()}'
  \ }
let g:lightline.component_function = {
  \ 'gitbranch':           'Gitbranch',
  \ }
" \ 'devicons_filetype':   'Devicons_Filetype',
" \ 'devicons_fileformat': 'Devicons_Fileformat',
" \ 'coc_status':          'coc#status',
" \ 'coc_currentfunction': 'CocCurrentFunction'
let g:lightline.component_expand = {
  \ 'linter_checking': 'lightline#ale#checking',
  \ 'linter_warnings': 'lightline#ale#warnings',
  \ 'linter_errors':   'lightline#ale#errors',
  \ 'linter_ok':       'lightline#ale#ok',
  \ 'asyncrun_status': 'lightline#asyncrun#status'
  \ }
let g:lightline.component_type = {
  \ 'linter_warnings': 'warning',
  \ 'linter_errors':   'error'
  \ }
let g:lightline.component_visible_condition = {
  \ 'gitstatus': 'lightline_gitdiff#get_status() !=# ""'
  \ }

let g:lightline.tabline_separator =    { 'left': "\ue0bc ", 'right': "\ue0ba " }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb ", 'right': "\ue0bb " }
let g:lightline.tabline = {
  \ 'left':  [ [ 'vim_logo', 'tabs' ] ],
  \ 'right': [ [ 'gitbranch' ], [ 'gitstatus' ] ]
  \ }
let g:lightline.tab = {
  \ 'active':   [ 'tabnum', 'filename', 'modified' ],
  \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
  \ }
let g:lightline.tab_component = {
  \ }
let g:lightline.tab_component_function = {
  \ 'filename': 'lightline#tab#filename',
  \ 'modified': 'lightline#tab#modified',
  \ 'readonly': 'lightline#tab#readonly',
  \ 'tabnum':   'Tab_num'
  \ }

" Tmuxline config
if g:vimIsInTmux == 1
  let g:tmuxline_preset = {
        \'a'    : '#S',
        \'b'    : '%R',
        \'c'    : [ '#{sysstat_mem} #[fg=blue]\ufa51#{upload_speed}' ],
        \'win'  : [ '#I', '#W' ],
        \'cwin' : [ '#I', '#W', '#F' ],
        \'x'    : [ "#[fg=blue]#{download_speed} \uf6d9 #{sysstat_cpu}" ],
        \'y'    : [ '%a' ],
        \'z'    : '#H #{prefix_highlight}'
        \}
  let g:tmuxline_separators = {
        \ 'left' :      "\ue0bc ",
        \ 'left_alt':   "\ue0bd ",
        \ 'right' :     "\ue0ba ",
        \ 'right_alt' : "\ue0bd ",
        \ 'space' :     ' '}

  autocmd VimEnter * Tmuxline lightline
endif

