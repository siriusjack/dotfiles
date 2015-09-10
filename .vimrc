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

    " Surround
    " http://vimblog.hatenablog.com/entry/vim_plugin_surround_vim
    NeoBundle 'tpope/vim-surround'

    " vim-virtualenv
    " virtualenvを処理できるようにする
    NeoBundle 'jmcantrell/vim-virtualenv'

    " neocomplete/Neocomplecache
    function! s:meet_neocomplete_requirements()
        return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
    endfunction
    if s:meet_neocomplete_requirements()
        NeoBundle 'Shougo/neocomplete.vim'
        NeoBundleFetch 'Shougo/neocomplcache.vim'
    else
        NeoBundleFetch 'Shougo/neocomplete.vim'
        NeoBundle 'Shougo/neocomplcache.vim'
    endif
    if s:meet_neocomplete_requirements()
        " neocomplete用設定
        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#enable_ignore_case = 1
        let g:neocomplete#enable_smart_case = 1
        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns._ = '\h\w*'
    else
        " neocomplcache用設定
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_ignore_case = 1
        let g:neocomplcache_enable_smart_case = 1
        if !exists('g:neocomplcache_keyword_patterns')
            let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns._ = '\h\w*'
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_underbar_completion = 1
    endif
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

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
    " unite
    nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
    nnoremap <silent> ,b :<C-u>Unite buffer <CR>
    nnoremap <silent> ,c :<C-u>Unite colorscheme -auto-preview<CR>

    " javascript
    NeoBundleLazy 'jelera/vim-javascript-syntax', { 'autoload':{ 'filetypes':[ 'javascript' ] } }
    " Julia
    " NeoBundleLazy 'JuliaLang/julia-vim', { 'autoload':{ 'filetypes':['julia'] } }
    NeoBundle 'JuliaLang/julia-vim'

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

" using utf-8
set encoding=utf-8
set fileencodings=utf-8

" Edit vimrc
noremap ,v :edit $MYVIMRC<CR>

" Colorscheme
colorscheme default

" 行番号を表示
set number

" カーソル行と列をハイライト
set cursorline
" \cでスイッチ
nnoremap <Leader>c :<C-u>setlocal cursorcolumn!<CR>

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


"******************************************************************************
" autocmd
"******************************************************************************
" 最後に閉じた場所から開く
if has("autocmd")
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
endif

" その他設定
runtime! config/*.vim
