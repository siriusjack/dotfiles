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
NeoBundle "yonchu/accelerated-smooth-scroll"
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
" 80行目にラインを引く
:set colorcolumn=80
" ターミナルでマウスを使えるようにする
:set mouse=a
:set guioptions+=a


"******************************************************************************
" NEOCOMPLETE.VIM
"******************************************************************************
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smatcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2


"******************************************************************************
" SMOOTH.SCROLL
"******************************************************************************
" http://yonchu.hatenablog.com/entry/2013/05/16/204727
let g:ac_smooth_scroll_fb_sleep_time_msec = 5
let g:ac_smooth_scroll_du_sleep_time_msec = 5

