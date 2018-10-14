if $HOME=='/root'
  if $USER=='root'
    if isdirectory('/home/your_typical_username')
      let rtuser = 'your_typical_username'
    elseif isdirectory('/home/your_other_username')
      let rtuser = 'your_other_username'
    endif
  else
    let rtuser = $USER
  endif
  let &runtimepath = substitute(&runtimepath, $HOME, '/home/'.rtuser, 'g')
endif

filetype plugin indent on
syntax on
syntax enable
colorscheme desert

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
set hlsearch
set incsearch 
set lazyredraw 
set magic
set showmatch 
set mat=2
set tm=500
"set cursorline


" Set vim bash to use login shell


set foldcolumn=1
set laststatus=1
set number
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

"""""""""""""""""""
" Localized Settings
"
au BufRead,BufNewFile,BufEnter ~/Documents/bjo/dev/beef-jerky-outlet/ setlocal ts=2 sts=2 sw=2 st ai si et

"""""""""""""""""""
" Key Mappings
"
"nmap <space> /
nmap nn :NERDTreeToggle<CR>
nmap <C-c> <Esc>
inoremap <C-c> <Esc>
nnoremap <C-c> <Esc>
nmap nh :noh<CR>

set pastetoggle=<C-P>
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
" Highlights
"
hi LineNr term=bold cterm=NONE ctermfg=Green ctermbg=None gui=NONE guifg=Green guibg=NONE
hi StatusLine ctermfg=0 ctermbg=DarkRed cterm=NONE
hi StatusLineNC ctermfg=Black ctermbg=White cterm=NONE
""""""""""""""""""
" NERDTree related
"
"

let g:vdebug_options = {'ide_key': 'xdebug'}
let g:vdebug_options = {'idekey': 'xdebug'}
let g:vdebug_options = {'break_on_open': 0}
"let g:vdebug_options = {'server': 'localhost'}
"let g:vdebug_options = {'port': '32774'}
"
let g:vdebug_options = {'server': 'localhost'}
let g:vdebug_options = {'port': '9001'}

" Bind alt + movement keys to move in insert mode
inoremap ˙ <Left>
inoremap ∆ <Down>
inoremap ˚ <Up>
inoremap ¬ <Right>
cnoremap ˙ <Left>
cnoremap ∆ <Down>
cnoremap ˚ <Up>
cnoremap ¬ <Right>



" vim: set noexpandtab:
" Vim syntax file
" Language:        Twig
" Maintainer:      Nelson Yeung
" URL:             https://github.com/nelsyeung/twig.vim
" Acknowledgement: Based on evidens/vim-twig

syntax case match

" Twig template built-in tags and parameters (without filter, macro, is and raw, they have special treatment)
syn keyword twigStatement containedin=twigVarBlock,twigTagBlock,twigNested contained and if else in not or recursive as import

syn keyword twigStatement containedin=twigVarBlock,twigTagBlock,twigNested contained is filter skipwhite nextgroup=twigFilter
syn keyword twigStatement containedin=twigTagBlock contained macro skipwhite nextgroup=twigFunction
syn keyword twigStatement containedin=twigTagBlock contained block skipwhite nextgroup=twigBlockName

" Variable Names
syn match twigVariable containedin=twigVarBlock,twigTagBlock,twigNested contained skipwhite /[a-zA-Z_][a-zA-Z0-9_]*/
syn keyword twigSpecial containedin=twigVarBlock,twigTagBlock,twigNested contained false true none loop super caller varargs kwargs

" Filters
syn match twigOperator "|" containedin=twigVarBlock,twigTagBlock,twigNested contained nextgroup=twigFilter
syn match twigFilter contained skipwhite /[a-zA-Z_][a-zA-Z0-9_]*/
syn match twigFunction contained skipwhite /[a-zA-Z_][a-zA-Z0-9_]*/
syn match twigBlockName contained skipwhite /[a-zA-Z_][a-zA-Z0-9_]*/

" Twig template constants
syn region twigString containedin=twigVarBlock,twigTagBlock,twigNested contained start=/"/ skip=/\\"/ end=/"/
syn region twigString containedin=twigVarBlock,twigTagBlock,twigNested contained start=/'/ skip=/\\'/ end=/'/
syn match twigNumber containedin=twigVarBlock,twigTagBlock,twigNested contained /[0-9]\+\(\.[0-9]\+\)\?/

" Operators
syn match twigOperator containedin=twigVarBlock,twigTagBlock,twigNested contained /[+\-*\/<>=!,:]/
syn match twigPunctuation containedin=twigVarBlock,twigTagBlock,twigNested contained /[()\[\]]/
syn match twigOperator containedin=twigVarBlock,twigTagBlock,twigNested contained /\./ nextgroup=twigAttribute
syn match twigAttribute contained /[a-zA-Z_][a-zA-Z0-9_]*/

" Twig template tag and variable blocks
syn region twigNested matchgroup=twigOperator start="(" end=")" transparent display containedin=twigVarBlock,twigTagBlock,twigNested contained
syn region twigNested matchgroup=twigOperator start="\[" end="\]" transparent display containedin=twigVarBlock,twigTagBlock,twigNested contained
syn region twigNested matchgroup=twigOperator start="{" end="}" transparent display containedin=twigVarBlock,twigTagBlock,twigNested contained
syn region twigTagBlock matchgroup=twigTagDelim start=/{%-\?/ end=/-\?%}/ skipwhite containedin=ALLBUT,twigTagBlock,twigVarBlock,twigRaw,twigString,twigNested,twigComment

syn region twigVarBlock matchgroup=twigVarDelim start=/{{-\?/ end=/-\?}}/ containedin=ALLBUT,twigTagBlock,twigVarBlock,twigRaw,twigString,twigNested,twigComment

" Twig template 'raw' tag
syn region twigRaw matchgroup=twigRawDelim start="{%\s*raw\s*%}" end="{%\s*endraw\s*%}" containedin=ALLBUT,twigTagBlock,twigVarBlock,twigString,twigComment

" Twig comments
syn region twigComment matchgroup=twigCommentDelim start="{#" end="#}" containedin=ALLBUT,twigTagBlock,twigVarBlock,twigString

" Block start keywords.  A bit tricker.  We only highlight at the start of a
" tag block and only if the name is not followed by a comma or equals sign
" which usually means that we have to deal with an assignment.
syn match twigStatement containedin=twigTagBlock contained skipwhite /\({%-\?\s*\)\@<=\<[a-zA-Z_][a-zA-Z0-9_]*\>\(\s*[,=]\)\@!/

" and context modifiers
syn match twigStatement containedin=twigTagBlock contained /\<with\(out\)\?\s\+context\>/ skipwhite

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_twig_syn_inits")
	if version < 508
		let did_twig_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink twigPunctuation twigOperator
	HiLink twigAttribute twigVariable
	HiLink twigFunction twigFilter

	HiLink twigTagDelim twigTagBlock
	HiLink twigVarDelim twigVarBlock
	HiLink twigCommentDelim twigComment
	HiLink twigRawDelim twig

	HiLink twigSpecial Special
	HiLink twigOperator Normal
	HiLink twigRaw Normal
	HiLink twigTagBlock PreProc
	HiLink twigVarBlock PreProc
	HiLink twigStatement Statement
	HiLink twigFilter Function
	HiLink twigBlockName Function
	HiLink twigVariable Identifier
	HiLink twigString Constant
	HiLink twigNumber Constant
	HiLink twigComment Comment

	delcommand HiLink
endif


"""""""""""""""""""
"""""""""""""""""""
"""""""""""""""""""
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

let g:reopenbuf = expand('%:p')
function! ReopenLastTabLeave()
  let g:lastbuf = expand('%:p')
  let g:lasttabcount = tabpagenr('$')
endfunction
function! ReopenLastTabEnter()
  if tabpagenr('$') < g:lasttabcount
    let g:reopenbuf = g:lastbuf
  endif
endfunction
function! ReopenLastTab()
  tabnew
  execute 'buffer' . g:reopenbuf
endfunction
augroup ReopenLastTab
  autocmd!
  autocmd TabLeave * call ReopenLastTabLeave()
  autocmd TabEnter * call ReopenLastTabEnter()
augroup END
" Tab Restore
nnoremap <leader>tr :call ReopenLastTab()<CR>
