"******************************************************************************
" NORMAL SETTINGS
"******************************************************************************
if &compatible
    set nocompatible
endif
" 256色モード
set t_Co=256
" Colorscheme
colorscheme darkblue
" using utf-8
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8
" 行番号を表示
set number
" ステータスラインを常に表示
set laststatus=2
" カーソル場所表示
set ruler
" 保存しなくてもファイルを切り替え
set hidden
" マウス使う
set mouse=a
set guioptions+=a
" クリップボード共有
set clipboard+=unnamed
" tab設定
set backspace=indent,eol,start
set autoindent smarttab smartindent "いい感じにインデント
set expandtab "Tabを空白に展開
set tabstop=8 "Tabを表示するときの表示上の空白数
set shiftwidth=4 "インデントの空白の数
set softtabstop=4 "Tabの空白の数
set list
set listchars=tab:./
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
" jjをESCに割当
inoremap jj <Esc>
" ;:を交換
noremap ; :
noremap : ;
" .vimrcを編集
noremap ,v :edit $MYVIMRC<CR>
" カーソル行と列をハイライト(\cでスイッチ)
set cursorline
nnoremap <Leader>c :<C-u>setlocal cursorcolumn!<CR>
" 80行目にラインを引く(ccでスイッチ)
hi ColorColumn guibg=#ffffff
noremap <Plug>(ToggleColorColumn)
            \ :<c-u>let &colorcolumn = len(&colorcolumn) > 0 ? '' :
            \   join(range(81, 9999), ',')<CR>
nmap cc <Plug>(ToggleColorColumn) 
" syntax
syntax on
filetype plugin indent on
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
" autocmd
"******************************************************************************
" 最後に閉じた場所から開く
if has("autocmd")
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
endif

"******************************************************************************
" Dein.vim
"******************************************************************************
if &compatible
    set nocompatible
endif

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

"******************************************************************************
" KeyMapping
"******************************************************************************
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
