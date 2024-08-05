let g:airline#themes#vndrx#palette = {}

" Normal mode
let s:N1 = [ '#080808' , '#C2D94C' , 232 , 149 , 'bold' ] " guifg guibg ctermfg ctermbg opt[:help attr-list]
let s:N2 = [ '#C2D94C' , '#304357' , 149 , 59  ]
let s:N3 = [ '#B3B1AD' , '#303030' , 145 , 235 ]

let g:airline#themes#vndrx#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#vndrx#palette.normal.airline_z = s:N2

"Normal mode - Modified
let s:NM1 = [ '#080808' , '#c08cff' , 232 , 171 , 'bold' ]
let s:NM2 = [ '#c08cff' , '#304357' , 171 , 59  ]

let g:airline#themes#vndrx#palette.normal_modified = airline#themes#generate_color_map(s:NM1, s:NM2, s:N3)
let g:airline#themes#vndrx#palette.normal_modified.airline_z = s:NM2

" Insert mode
let s:I1 = [ '#080808' , '#39BAE6' , 232 , 74  , 'bold' ]
let s:I2 = [ '#39BAE6' , '#304357' , 74  , 59  ]

let g:airline#themes#vndrx#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:N3)
let g:airline#themes#vndrx#palette.insert.airline_z = s:I2

" Visual mode
let s:V1 = [ '#080808' , '#ffaf00' , 232 , 214 , 'bold' ]
let s:V2 = [ '#ffaf00' , '#304357' , 214 , 59  ]

let g:airline#themes#vndrx#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:N3)
let g:airline#themes#vndrx#palette.visual.airline_z = s:V2

" Replace mode
let s:RE1 = [ '#ffffff' , '#d74444' , 231 , 9 , 'bold' ]
let s:RE2 = [ '#d74444' , '#304357' , 149 , 59  ]

let g:airline#themes#vndrx#palette.replace = airline#themes#generate_color_map(s:RE1, s:RE2, s:N3)
let g:airline#themes#vndrx#palette.replace.airline_z = s:RE2

let g:airline#themes#vndrx#palette.insert_replace = {
    \ 'airline_a': [ s:RE1[0]   , s:I1[1]   , s:RE1[1]   , s:I1[3]   , ''     ],
    \ 'airline_z': [ s:RE1[0]   , s:I1[1]   , s:RE1[1]   , s:I1[3]   , ''     ] }

" Inactive mode
let s:IA1 = [ '#777777' , '#4a4a4a' , 240 , 237     , '' ]
let s:IA2 = [ '#777777' , '#3a3a3a' , 242 , 236     , '' ]
let s:IA3 = [ '#999999' , '#303030' , 244 , 235 , '' ]

let g:airline#themes#vndrx#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

" Tabline
let s:TN  = [ '#C2D94C' , '#304357' , 149 , 59  ] " normal buffers
let s:TM  = [ '#080808' , '#c08cff' , 232 , 171 , 'bold' ]   " modified buffers
let s:TMU = [ '#c08cff' , '#304357' , 171 , 59  ]   " modified unselected buffers
let s:TH  = [ '#C2D94C',  '#080808' , 149 , 232 ]  " hidden buffers

let g:airline#themes#vndrx#palette.tabline = {
    \ 'airline_tab': s:TH,
    \ 'airline_tabmod': s:TM,
    \ 'airline_tabmod_unsel': s:TMU,
    \ 'airline_tabhid': s:TN }

" Warning
let s:WRN = ['#080808' , '#d6801a' , 232 , 214 , 'bold' ]

let g:airline#themes#vndrx#palette.normal.airline_warning = s:WRN
let g:airline#themes#vndrx#palette.normal_modified.airline_warning = s:WRN
let g:airline#themes#vndrx#palette.insert.airline_warning = s:WRN
let g:airline#themes#vndrx#palette.visual.airline_warning = s:WRN
let g:airline#themes#vndrx#palette.replace.airline_warning = s:WRN

" Error
let s:ERR = [ '#ffffff' , '#d74444' , 231 , 9 , 'bold' ]

let g:airline#themes#vndrx#palette.normal.airline_error = s:ERR
let g:airline#themes#vndrx#palette.normal_modified.airline_error = s:ERR
let g:airline#themes#vndrx#palette.insert.airline_error = s:ERR
let g:airline#themes#vndrx#palette.visual.airline_error = s:ERR
let g:airline#themes#vndrx#palette.replace.airline_error = s:ERR
