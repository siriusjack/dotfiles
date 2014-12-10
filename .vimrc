"******************************************************************************
" release autogroup in MyAutoCmd
"******************************************************************************
augroup MyAutoCmd
    autocmd!
augroup END


"****************************************************************************** 
" NEO BUNDLE
"****************************************************************************** 
let s:noplugin = 0
let s:bundle_root = expand('~/.vim/bundle')
let s:neobundle_root = s:bundle_root . '/neobundle.vim'
if !isdirectory(s:neobundle_root) || v:version < 702
    " NeoBundleが存在しない、もしくはVimのバージョンが古い場合はプラグインを一切
    " 読み込まない
    let s:noplugin = 1
else
    " NeoBundleを'runtimepath'に追加し初期化を行う
    if has('vim_starting')
        execute "set runtimepath+=" . s:neobundle_root
    endif
    call neobundle#begin(s:bundle_root)
    "call neobundle#rc(s:bundle_root)
    " NeoBundle自身をNeoBundleで管理させる
    NeoBundleFetch 'Shougo/neobundle.vim'

    " 非同期通信を可能にする
    " 'build'が指定されているのでインストール時に自動的に
    " 指定されたコマンドが実行され vimproc がコンパイルされる
    NeoBundle "Shougo/vimproc", {
                \ "build": {
                \   "windows"   : "make -f make_mingw32.mak",
                \   "cygwin"    : "make -f make_cygwin.mak",
                \   "mac"       : "make -f make_mac.mak",
                \   "unix"      : "make -f make_unix.mak",
                \ }}
    "	if has('lua') && v:version >= 703 && has('patch885')
    if has('lua') && v:version >= 703
        NeoBundleLazy "Shougo/neocomplete.vim", {
                    \ "autoload": {
                    \   "insert": 1,
                    \ }}
        " 2013-07-03 14:30 NeoComplCacheに合わせた
        let g:neocomplete#enable_at_startup = 1
        let s:hooks = neobundle#get_hooks("neocomplete.vim")
        function! s:hooks.on_source(bundle)
            let g:acp_enableAtStartup = 0
            let g:neocomplet#enable_smart_case = 1
            " NeoCompleteを有効化
            " NeoCompleteEnable
        endfunction
    else
        " NeoBundleLazy "Shougo/neocomplcache.vim", {
        " 			\ "autoload": {
        " 			\   "insert": 1,
        " 			\ }}
        " 2013-07-03 14:30 原因不明だがNeoComplCacheEnableコマンドが見つからないので変更
        " let g:neocomplcache_enable_at_startup = 1
        " let s:hooks = neobundle#get_hooks("neocomplcache.vim")
        " function! s:hooks.on_source(bundle)
        " 	let g:acp_enableAtStartup = 0
        " 	let g:neocomplcache_enable_smart_case = 1
        " 	" NeoComplCacheを有効化
        " 	" NeoComplCacheEnable 
        " endfunction
    endif


    NeoBundle "Shougo/unite.vim"
    nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
    nnoremap <silent> ,b :<C-u>Unite buffer <CR>


    NeoBundle 'Shougo/vimshell.vim'
    nnoremap <silent> ,is :VimShell<CR>
    nnoremap <silent> ,ipy :VimShellInteractive python<CR>
    nnoremap <silent> ,irb :VimShellInteractive irb<CR>
    vmap <silent> ,ss :VimShellSendString<CR>
    nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>

    NeoBundle 'Shougo/vimfiler.vim'
    let g:vimfiler_as_default_explorer = 1


    NeoBundle 'vim-scripts/YankRing.vim'
    NeoBundle "taglist.vim"
    " NeoBundle 'vim-scripts/gtags.vim'
    " NeoBundle 'yonchu/accelerated-smooth-scroll'
    " NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
    NeoBundle 'scrooloose/syntastic'
    let g:syntastic_python_checkers = ['pyflakes', 'pep8']


    " color schemes "
    NeoBundle 'ujihisa/unite-colorscheme'
    nnoremap <silent> ,c :<C-u>Unite colorscheme -auto-preview<CR>
    NeoBundle 'tomasr/molokai'
    NeoBundle 'nanotech/jellybeans.vim'
    NeoBundle 'altercation/vim-colors-solarized'
    NeoBundle 'thinca/vim-quickrun'
    " NeoBundleLazy "thinca/vim-quickrun", {
    "				\ "autoload": {
    "				\  "mappings": [['nxo', '<Plug>(quickrun)']]
    "				\ }} 
    nmap <Leader>r <Plug>(quickrun)
    let g:quickrun_config = {
                \ "_" : {
                \ "runner" : "vimproc",
                \ "runner/vimproc/updatetime" : 60,
                \ "vsplit" : "",
                \},
                \}
    noremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
    set splitbelow
    set splitright
    NeoBundle 'alpaca-tc/alpaca_powertabline'
    NeoBundle 'Lokaltog/vim-powerline'


    "Vimで正しくvirtualenvを処理できるようにする
    NeoBundle 'jmcantrell/vim-virtualenv'
    " Djangoを正しくVimで読み込めるようにする
    " NeoBundleLazy "lambdalisue/vim-django-support", {
    " 			\ "autoload": {
    " 			\   "filetypes": ["python", "python3", "djangohtml"]
    " 			\ }}
    " Jedi
    NeoBundleLazy "davidhalter/jedi-vim", {
                \ "autoload": {
                \   "filetypes": ["python", "python3", "djangohtml"],
                \ },
                \ "build": {
                \   "mac": "pip install jedi",
                \   "unix": "pip install jedi",
                \ }}
    let s:hooks = neobundle#get_hooks("jedi-vim")
    function! s:hooks.on_source(bundle)
        " jediにvimの設定を任せると'completeopt+=preview'するので
        " 自動設定機能をOFFにし手動で設定を行う
        let g:jedi#auto_vim_configuration = 0
        " 補完の最初の項目が選択された状態だと使いにくいためオフにする
        let g:jedi#popup_select_first = 0
        let s:save_cpo = &cpo
        set cpo&vim

        if g:jedi#popup_select_first == 0
            inoremap <buffer> . .<C-R>=jedi#complete_opened() ? "" : "\<lt>C-X>\<lt>C-O>\<lt>C-P>"<CR>
        endif

        let &cpo = s:save_cpo
        unlet s:save_cpo
        " quickrunと被るため大文字に変更
        let g:jedi#rename_command = '<Leader>R'
        " gundoと被るため大文字に変更
        let g:jedi#goto_assignments_command = '<Leader>G'
    endfunction	


    " インストールされていないプラグインのチェックおよびダウンロード
    NeoBundleCheck

    call neobundle#end()
endif

" ファイルタイププラグインおよびインデントを有効化
" NeoBundleによる処理が終了したあとに呼ばなければならない
syntax on
filetype on
filetype plugin indent on " Required!


"******************************************************************************
" NORMAL SETTINGS
"******************************************************************************
" 80行目にラインを引く
":set colorcolumn=80
hi ColorColumn guibg=#ffffff
noremap <Plug>(ToggleColorColumn)
            \ :<c-u>let &colorcolumn = len(&colorcolumn) > 0 ? '' :
            \   join(range(81, 9999), ',')<CR>
nmap cc <Plug>(ToggleColorColumn)

" 入力モード龍に素早くjjを入力した場合にESC
inoremap jj <Esc>
" ; と : を交換
noremap ; :
noremap : ;
" clipboard integration
set clipboard+=unnamed
" colorscheme
colorscheme darkblue 
set backspace=indent,eol,start
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent
set smartindent
set list
set listchars=tab:.\ 
set mouse=a "mouse on 
set guioptions+=a
" バックアップなし
set nowritebackup
set nobackup
set noswapfile
" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" shift + 矢印でウィンドウサイズを変更
nnoremap <silent> <S-Left>  :5wincmd <<CR>
nnoremap <silent> <S-Right> :5wincmd ><CR>
nnoremap <silent> <S-Up>    :5wincmd -<CR>
nnoremap <silent> <S-Down>  :5wincmd +<CR>
" Edit vimrc
noremap ,v :edit $MYVIMRC<CR>

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
" Add the virtualenv's site-packages to vim path
"******************************************************************************
"if has('python')
"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    sys.path.insert(0, project_base_dir)
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    execfile(activate_this, dict(__file__=activate_this))
"    EOF
"endif
