"****************************************************************************** 
" NEO BUNDLE
"****************************************************************************** 

set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

NeoBundle "neocomplete.vim"
NeoBundle "taglist.vim"
syntax on
filetype on
filetype plugin indent on " Required!


"******************************************************************************
" NORMAL SETTINGS
"******************************************************************************

" execute "set colorcolumn=" . join(range(81, 9999), ',')

:set tabstop=2
:set noexpandtab
:set shiftwidth=2
:set softtabstop=2
:set autoindent
:set smartindent
:set list
:set listchars=tab:.\ 
:set colorcolumn=80
:set mouse=a



"******************************************************************************
" NEOCOMPLETE.VIM
"******************************************************************************
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smatcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2

