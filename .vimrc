
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
"Plugin 'Valloric/YouCompleteMe'  "unavailable: requires Vim 8.1.2269+
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'haya14busa/incsearch.vim'
Plugin 'will133/vim-dirdiff'

filetype plugin indent on


syntax on
set t_Co=256
colorscheme torte  "use in putty"
if &diff
    highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
endif


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

"================================mouse setting====================================="
set mouse=a
map <C-z> :call SwitchMouseMode()<CR>
map! <C-z> <Esc>:call SwitchMouseMode()<CR>
function SwitchMouseMode()
    if (&mouse == "a")
        let &mouse = ""
        echo "Mouse is disabled."
    else
        let &mouse = "a"
        echo "Mouse is enabled."
    endif
endfunction

map <C-n> :call SwitchFullSimpleMode()<CR>
map! <C-n> <Esc>:call SwitchFullSimpleMode()<CR>
function SwitchFullSimpleMode()
    if (&mouse == "a")
        let &mouse = ""
        set nocindent
        set nonumber
        set wrap
		Tlist
        echo "Switch to simple mode.(nomouse, nonumber, nocindent, wrap)"
    else
        let &mouse = "a"
        set cindent
        set number
        set nowrap
		Tlist
        echo "Switch to full mode.(mouse, number, cindent, nowrap)"
    endif
endfunction
"==============================================================================="

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
hi ModeMsg ctermfg=Green   "for cscope search color "


"cscope settings"
if has("cscope")
	set csprg=/usr/bin/cscope
    "add any database in current dir
    if filereadable("cscope.out")
        cs add cscope.out
    "else search cscope.out elsewhere
    else
        let cscope_file=findfile("cscope.out", ".;")
        let cscope_pre=matchstr(cscope_file, ".*/")
        if !empty(cscope_file) && filereadable(cscope_file)
            exe "cs add" cscope_file cscope_pre
        endif
    endif
endif

noremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
noremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
noremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
noremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
noremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
noremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
noremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
noremap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>


"y & p"
vnoremap <Leader>y "+y
nmap <Leader>p "+p


"hot key"
map <f2> :NERDTreeToggle<CR>
map <f9> :Tlist<CR>
map <f10> :set invnumber<CR>


