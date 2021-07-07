" Edit of embark lightline theme.
" Moe Dark colours by Jomada [https://www.opencode.net/jomada/moe-theme]

let s:term_background =  { "gui": "#26292e", "cterm": "0",  "cterm16": "0" }

let s:term_black =       { "gui": "#3b3b3b", "cterm": "0",  "cterm16": "0" }
let s:term_red =         { "gui": "#ff597d", "cterm": "1",  "cterm16": "1" }
let s:term_green =       { "gui": "#2bb1af", "cterm": "2",  "cterm16": "2" }
let s:term_yellow =      { "gui": "#39abdc", "cterm": "3",  "cterm16": "3" }
let s:term_blue =        { "gui": "#ff6277", "cterm": "4",  "cterm16": "4" }
let s:term_purple =      { "gui": "#c679dd", "cterm": "5",  "cterm16": "5" }
let s:term_cyan =        { "gui": "#ffe185", "cterm": "6",  "cterm16": "6" }
let s:term_white =       { "gui": "#9cacad", "cterm": "7",  "cterm16": "7" }

let s:term_grey =        { "gui": "#575757", "cterm": "8",  "cterm16": "8" }
let s:term_dark_red =    { "gui": "#e55073", "cterm": "9",  "cterm16": "9" }
let s:term_dark_green =  { "gui": "#28a5a3", "cterm": "10", "cterm16": "10"}
let s:term_dark_yellow = { "gui": "#369ecf", "cterm": "11", "cterm16": "11"}
let s:term_dark_blue =   { "gui": "#ff596c", "cterm": "12", "cterm16": "12"}
let s:term_dark_purple = { "gui": "#c678dd", "cterm": "13", "cterm16": "13"}
let s:term_dark_cyan =   { "gui": "#ffe080", "cterm": "14", "cterm16": "14"}
let s:term_dark_grey =   { "gui": "#4a5f6a", "cterm": "15", "cterm16": "15"}

let s:bg          = s:term_black
let s:bg_dark     = s:term_background
let s:bg_bright   = s:term_grey
let s:norm        = s:term_white
let s:norm_subtle = s:term_dark_grey
let s:visual      = s:bg_bright

let s:lfc = {
      \'black':        [ s:term_black.gui,       s:term_black.cterm16       ],
      \'background':   [ s:term_background.gui,  s:term_background.cterm16  ],
      \'red':          [ s:term_red.gui,         s:term_red.cterm16         ],
      \'green':        [ s:term_green.gui,       s:term_green.cterm16       ],
      \'blue':         [ s:term_yellow.gui,      s:term_yellow.cterm16      ],
      \'redder':       [ s:term_blue.gui,        s:term_blue.cterm16        ],
      \'purple':       [ s:term_purple.gui,      s:term_purple.cterm16      ],
      \'yellow':       [ s:term_cyan.gui,        s:term_cyan.cterm16        ],
      \'white':        [ s:term_white.gui,       s:term_white.cterm16       ],
      \'grey':         [ s:term_grey.gui,        s:term_grey.cterm16        ],
      \'dark_red':     [ s:term_dark_red.gui,    s:term_dark_red.cterm16    ],
      \'dark_green':   [ s:term_dark_green.gui,  s:term_dark_green.cterm16  ],
      \'dark_blue':    [ s:term_dark_yellow.gui, s:term_dark_yellow.cterm16 ],
      \'dark_redder':  [ s:term_dark_blue.gui,   s:term_dark_blue.cterm16   ],
      \'dark_purple':  [ s:term_dark_purple.gui, s:term_dark_purple.cterm16 ],
      \'dark_yellow':  [ s:term_dark_cyan.gui,   s:term_dark_cyan.cterm16   ],
      \'dark_grey':    [ s:term_dark_grey.gui,   s:term_dark_grey.cterm16   ],
      \'bg':           [ s:bg.gui,               s:bg.cterm16               ],
      \'bg_dark':      [ s:bg_dark.gui,          s:bg_dark.cterm16          ],
      \'bg_bright':    [ s:bg_bright.gui,        s:bg_bright.cterm16        ],
      \'norm':         [ s:norm.gui,             s:norm.cterm16             ],
      \'norm_subtle':  [ s:norm_subtle.gui,      s:norm_subtle.cterm16      ],
      \}

let s:p = { 'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {} }

" LEGEND:            PRIMARY:[FOREGROUND     BACKGROUND] SECONDARY:[FOREGROUND      BACKGROUND]
let s:p.tabline.left    = [ [ s:lfc.white,   s:lfc.bg_dark     ], [ s:lfc.white,    s:lfc.grey       ] ]
let s:p.tabline.tabsel  = [ [ s:lfc.bg_dark, s:lfc.dark_redder ] ]
let s:p.tabline.middle  = [ [ s:lfc.white,   s:lfc.bg_dark     ] ]
let s:p.tabline.right   = [ [ s:lfc.bg_dark, s:lfc.dark_redder ] ]

let s:p.normal.left     = [ [ s:lfc.bg_dark, s:lfc.redder      ], [ s:lfc.white,   s:lfc.black       ] ]
let s:p.normal.middle   = [ [ s:lfc.white,   s:lfc.bg_dark     ] ]
let s:p.normal.right    = [ [ s:lfc.bg_dark, s:lfc.redder      ], [ s:lfc.white,   s:lfc.black       ] ]
let s:p.normal.error    = [ [ s:lfc.red,     s:lfc.bg_dark     ] ]
let s:p.normal.warning  = [ [ s:lfc.blue,    s:lfc.bg_dark     ] ]

let s:p.visual.left     = [ [ s:lfc.bg_dark, s:lfc.purple      ], [ s:lfc.white,   s:lfc.black       ] ]
let s:p.visual.right    = [ [ s:lfc.bg_dark, s:lfc.purple      ], [ s:lfc.white,   s:lfc.black       ] ]

let s:p.replace.left    = [ [ s:lfc.bg_dark, s:lfc.green       ], [ s:lfc.white,   s:lfc.black       ] ]
let s:p.replace.right   = [ [ s:lfc.bg_dark, s:lfc.green       ], [ s:lfc.white,   s:lfc.black       ] ]

let s:p.insert.left     = [ [ s:lfc.bg_dark, s:lfc.yellow      ], [ s:lfc.white,   s:lfc.black       ] ]
let s:p.insert.right    = [ [ s:lfc.bg_dark, s:lfc.yellow      ], [ s:lfc.white,   s:lfc.black       ] ]

let s:p.inactive.left   = [ [ s:lfc.grey,    s:lfc.bg_dark     ], [ s:lfc.grey,    s:lfc.bg_dark     ] ]
let s:p.inactive.middle = [ [ s:lfc.grey,    s:lfc.bg_dark     ] ]
let s:p.inactive.right  = [ [ s:lfc.grey,    s:lfc.bg_dark     ], [ s:lfc.grey,    s:lfc.bg_dark     ] ]

let g:lightline#colorscheme#moedark#palette = lightline#colorscheme#flatten(s:p)

