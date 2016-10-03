" **********  general stuff *******
" vim not vi... always
set nocompatible
" statusline
set laststatus=2
" don't display macro steps
set lazyredraw
" print line and character numbers
set ruler
set nu

" *************** auto tabing ***************
" next 3 options: don't do auto indenting shit
" do autoindenting for C
set cindent
" do autoindenting for any language
" set smartindent
" do try maintain the current tabstop when I start a new line
set autoindent

" *************** tabing ***************
" # spaces to expand tab character to
set tabstop=8
" number of spaces to use for autoindenting
set shiftwidth=2
" round any autotabbing to shiftwidth
set shiftround
" turn tabs into spaces
set expandtab
" for non-display, only editing purposes, treat tabs as this many spaces
" 0 is get what I see
set softtabstop=2
" make spaces act properly like tabs with backspace and stuff 
set smarttab

" **************** movement **************
" allow backspace over everything
set backspace=indent,eol,start
" scroll when less then n lines from bottom
set scrolloff=5
"~ no cursor keys... makes escape faster
set esckeys 
" allow these keys to switch lines (] is next paragraph)
set whichwrap=h,l,<,>,[,]
" fix wrap to 80
set textwidth=75
" don't wrap, add an endline instead
" set nowrap
set nocindent


" ************** some display parameters ************
" be slower, we're probably running on the same machine 
" makes updates smoother
set ttyfast
" show the command as I type it
set showcmd
" don't highlight every instance of search string
set nohlsearch
" The following three lines are for unselecting searched text
imap <C-C> <C-0>:nohlsearch
nmap <C-C>      :nohlsearch
vmap <C-C>      :nohlsearch

" ******************** tmp files and syncing *************************
" basically... the next 4 options are please don't write shit to disk...
" I mean ANYTHING, note this means no lock files
" no backup files
set nobackup
" don't write to backup files
set nowritebackup
" no swap files
set noswapfile
" don't sync when I save
set swapsync="fsync"
" put swap files in dir
set dir=~/tmp

" *********************** syntax stuff **********************8
" show matching brackets
set showmatch
" File types
syntax enable
filetype plugin indent on
if has("terminfo")
  set t_Co=8
  set t_Sf=[3%p1%dm
  set t_Sb=[4%p1%dm
else
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" OCaml stuff
let no_ocaml_comments = 1
set makeprg=omake

" Twelf stuff
 augroup filetype
   au! BufRead,BufNewFile *.elf set filetype=twelf
   au! BufRead,BufNewFile *.thm set filetype=twelf
   au! BufRead,BufNewFile *.clf set filetype=twelf
   au! BufRead,BufNewFile *.cep set filetype=ceptre
 augroup END

 augroup filetype
   au! BufRead,BufNewFile *.fun set filetype=sml
 augroup END


" more twelf stuff (indentation)
  au FileType twelf setlocal formatoptions-=ro
  au FileType twelf filetype indent on
  au FileType twelf source ~/.vim/indent/twelf.vim


colorscheme desert
