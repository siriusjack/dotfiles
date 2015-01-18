"******************************************************************************
" release autogroup in MyAutoCmd
"******************************************************************************
augroup MyAutoCmd
    autocmd!
augroup END


if &compatible
    set nocompatible
endif


"****************************************************************************** 
" NEO BUNDLE
"****************************************************************************** 
let s:noplugin = 0
let s:bundle_root = expand('~/.vim/bundle')
let s:neobundle_root = s:bundle_root . '/neobundle.vim'
if !isdirectory(s:neobundle_root) || v:version < 702
    " NeoBundleが存在しない、もしくはVimのバージョンが古い場合は無効にする
    let s:noplugin = 1
else
    " NeoBundleを'runtimepath'に追加し初期化を行う
    if has('vim_starting')
        execute "set runtimepath+=" . s:neobundle_root
    endif
    call neobundle#begin(s:bundle_root)
    " NeoBundle自身をNeoBundleで管理させる
    NeoBundleFetch 'Shougo/neobundle.vim'

    " YankRing
    " ヤンク履歴を管理 C-P/C-Nで履歴がぐるぐる回る
    NeoBundle 'vim-scripts/YankRing.vim'

    " vim-virtualenv
    " virtualenvを処理できるようにする
    NeoBundle 'jmcantrell/vim-virtualenv'

    " neocomplete/Neocomplecache
    " 入力補完機能を追加
    if has('lua') && v:version >= 703
        NeoBundleLazy "Shougo/neocomplete.vim", {
                    \ "autoload": {
                    \   "insert": 1,
                    \ }}
        " Use neocomplete.
        let g:neocomplete#enable_at_startup = 1
        " Set min_keyword_length
        let g:neocomplete#sources#syntax#min_keyword_length = 2
        " Set s:hooks


        let s:hooks = neobundle#get_hooks("neocomplete.vim")
        function! s:hooks.on_source(bundle)
            let g:acp_enableAtStartup = 0
            " Use smatcase.
            let g:neocomplet#enable_smart_case = 1
        endfunction
    else
        NeoBundleLazy "Shougo/neocomplcache.vim", {
                    \ "autoload": {
                    \   "insert": 1,
                    \ }}
    endif

    " unite
    " vim pluginの統一的な環境を提供する
    NeoBundle "Shougo/unite.vim"
    " unite-color schemes 
    NeoBundle 'ujihisa/unite-colorscheme'
    NeoBundle 'tomasr/molokai'
    NeoBundle 'nanotech/jellybeans.vim'
    NeoBundle 'altercation/vim-colors-solarized'
    " vimfiler
    NeoBundle 'Shougo/vimfiler.vim'
    let g:vimfiler_as_default_explorer = 1
    " unite系キーマッピング（少し邪道かも）
    nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
    nnoremap <silent> ,b :<C-u>Unite buffer <CR>
    nnoremap <silent> ,c :<C-u>Unite colorscheme -auto-preview<CR>


    " vimproc
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
    " quickrun
    " コードの即時実行を可能にする
    " vimprocを使うことで非同期に実行する
    NeoBundle 'thinca/vim-quickrun'
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


    " インストールされていないプラグインのチェックおよびダウンロード
    NeoBundleCheck
    call neobundle#end()
endif



"******************************************************************************
" NORMAL SETTINGS
"******************************************************************************
" ファイルタイププラグインおよびインデントを有効
" NeoBundleによる処理が終了したあとに呼ばなければならない
syntax on
filetype on
filetype plugin indent on " Required!

" Edit vimrc
noremap ,v :edit $MYVIMRC<CR>

" Colorscheme
colorscheme molokai

" 行番号を表示
set number

" カーソル行と列をハイライト
set cursorline
set cursorcolumn
" \cでスイッチ
nnoremap <Leader>c :<C-u>setlocal cursorline! cursorcolumn!<CR>

" 80行目にラインを引く
hi ColorColumn guibg=#ffffff
noremap <Plug>(ToggleColorColumn)
            \ :<c-u>let &colorcolumn = len(&colorcolumn) > 0 ? '' :
            \   join(range(81, 9999), ',')<CR>
" ccでスイッチ
nmap cc <Plug>(ToggleColorColumn) 

" jjでESC
inoremap jj <Esc>

" ; と : を交換
noremap ; :
noremap : ;

" clipboard integration
set clipboard+=unnamed

" tab設定
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

" マウス使う
set mouse=a "mouse on 
set guioptions+=a
