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
    call neobundle#rc(s:bundle_root)

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

    NeoBundle "Shougo/unite.vim"
    NeoBundle "taglist.vim"
    NeoBundle 'vim-scripts/gtags.vim'
    " NeoBundle "yonchu/accelerated-smooth-scroll"
    NeoBundle "git://git.code.sf.net/p/vim-latex/vim-latex"
    
    " color scheme "
    NeoBundle 'ujihisa/unite-colorscheme'
    NeoBundle 'tomasr/molokai'
    NeoBundle 'nanotech/jellybeans.vim'
    NeoBundle 'vim-scripts/newspaper.vim'
    " NeoBundle "scrooloose/syntastic", {
    "       \ "build": {
    "       \   "mac": ["pip install flake8", "npm -g install coffeelint"],
    "       \   "unix": ["pip install flake8", "npm -g install coffeelint"],
    "       \ }}
    NeoBundle 'Shougo/vimshell.vim'
    NeoBundleLazy "thinca/vim-quickrun", {
    	\ "autoload": {
    	\  "mappings": [['nxo', '<Plug>(quickrun)']]
    	\ }} 
    nmap <Leader>r <Plug>(quickrun)
    let s:hooks = neobundle#get_hooks("vim-quickrun")
    function! s:hooks.on_source(bundle)
    	let g:quickrun_config = {
    		\ "*": {"runner": "remote/vimproc"},
    		\ }
    endfunction

		"Vimで正しくvirtualenvを処理できるようにする
		NeoBundle 'jmcantrell/vim-virtualenv'
		" Djangoを正しくVimで読み込めるようにする
		NeoBundleLazy "lambdalisue/vim-django-support", {
		      \ "autoload": {
		            \   "filetypes": ["python", "python3", "djangohtml"]
		                  \ }}

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
		  " quickrunと被るため大文字に変更
		  let g:jedi#rename_command = '<Leader>R'
		  " gundoと被るため大文字に変更 (2013-06-24 10:00 追記）
		  let g:jedi#goto_command = '<Leader>G'
		endfunction	

		" インストールされていないプラグインのチェックおよびダウンロード
    NeoBundleCheck
endif

" ファイルタイププラグインおよびインデントを有効化
" これはNeoBundleによる処理が終了したあとに呼ばなければならない
syntax on
filetype on
filetype plugin indent on " Required!


"******************************************************************************
" NORMAL SETTINGS
"******************************************************************************

" execute "set colorcolumn=" . join(range(81, 9999), ',')
colorscheme elflord

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
" バックアップなし
set nowritebackup
set nobackup
set noswapfile
" 入力モード龍に素早くjjを入力した場合にESC
inoremap jj <Esc>
" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"******************************************************************************
" UNITE.COLORSCHEME 
"******************************************************************************
nnoremap <silent> ,uc :<C-u>Unite colorscheme -auto-preview<CR>

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

"******************************************************************************
" Vim-LaTeX
"******************************************************************************
let g:Tex_DefaultTargetFormat = 'pdf' "標準で.pdfにコンパイルして開いてね
let g:Tex_ViewRule_pdf = 'open -a Preview.app' "PDFはPreview.appで開いてね
let g:Tex_CompileRule_pdf = 'pdfplatex $*.tex' "pdflatexを使って.texから.pdfに変換してね

"******************************************************************************
" gTags 
"******************************************************************************
map <C-g> :Gtags
map <C-i> :Gtags -f %<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
map <C-\> :GtagsCursor<CR>
