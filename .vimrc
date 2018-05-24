filetype plugin indent on
syntax on
syntax enable
set background=dark
colorscheme Monokai

hi StatusLine ctermfg=0 ctermbg=DarkRed cterm=NONE
hi StatusLineNC ctermfg=Black ctermbg=White cterm=NONE
"""""""""""""""""""
" Settings
"
set autoindent
set smarttab
set smartindent
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
set number
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

"""""""""""""""""""
" Local Settings
"
au BufRead,BufNewFile,BufEnter ~/Documents/bjo/dev/beef-jerky-outlet/ setlocal ts=2 sts=2 sw=2 st ai si

"""""""""""""""""""
" Key Mappings
"
nmap <space> /
nmap nn :NERDTreeToggle<CR>
nmap <C-c> <Esc>
inoremap <C-c> <Esc>
nnoremap <C-c> <Esc>

"""""""""""""""""
" Bind gb to move backwards in tabs
"
nmap gb gT

""""""""""""""""""
" Resize splits
"
nmap vv- :vertical res -10<CR>
nmap vv+ :vertical res +10<CR>
nmap H- :res -10<CR>
nmap H+ :res +10<CR>

"""""""""""""""""""
" Random misc stuff
"
execute pathogen#infect()
call pathogen#helptags()

"""""""""""""""""""
" Ruler Styles
"
highlight LineNr term=bold cterm=NONE ctermfg=Green ctermbg=NONE gui=NONE guifg=Green guibg=NONE

""""""""""""""""""
" NERDTree related
"
