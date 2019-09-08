
syntax on
set t_Co=256
"colorscheme torte  "use in putty"

set number
set enc=utf8

"use tab key as usual"
set smarttab
set autoindent
set smartindent

"tab transfer to space"
"set cinent "auto indent"
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
"set expandtab

set wrap   "folding"
set hls    "highlight keyword"


filetype on

"NERDTree settings" 
let NERDTreeIgnore = ['\.o', '\.bin']   "Ignore *.o files"
let g:NERDTreeHidden = 0
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif


"taglist settings"
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_show_One_File = 1   "Only Show the current file's tag"
let Tlist_Exit_OnlyWindow = 1  "If taglist is the last window, then exit"
let Tlist_Use_Right_Window = 1  "Show the taglist window at the right side"
let Tlist_Auto_Open = 1 "Default Open taglist"


"ctags settings"
set tags=./tags,./TAGS,tags;~,TAGS;~


"show path/filename"
set laststatus=2
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&encoding}, " encoding
set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
highlight User1 ctermfg=red
highlight User2 term=underline cterm=underline ctermfg=green
highlight User3 term=underline cterm=underline ctermfg=yellow
highlight User4 term=underline cterm=underline ctermfg=white
highlight User5 ctermfg=cyan
highlight User6 ctermfg=white


"hot key"
map <f2> :NERDTreeToggle<CR>
nmap <f3> :SrcExplToggle<CR>
map <f9> :Tlist<CR>
map <f10> :set invnumber<CR>


