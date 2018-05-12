filetype plugin indent on
syntax on

"""""""""""""""""""
" Settings
"
set autoindent
set ruler
set tabstop=4
set shiftwidth=4
set expandtab
set cmdheight=2
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set incsearch 
set lazyredraw 
set magic
set showmatch 
set mat=2
set tm=500
set foldcolumn=1
set laststatus=1

"""""""""""""""""""
" Key Mappings
"
map <space> /
map <c-space> ?
nmap nn :NERDTreeToggle<CR>

"""""""""""""""""""
" Random misc stuff
"
execute pathogen#infect()
call pathogen#helptags()
