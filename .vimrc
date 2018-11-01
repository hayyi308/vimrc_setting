set cindent

set number

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set wrap

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
"let Tlist_Auto_Open = 1 "Default Open taglist"


map <f2> :NERDTreeToggle<CR>
map <f9> :Tlist<CR>


