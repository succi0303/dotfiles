" neobundle

set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'fuenor/qfixgrep'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'vim-ruby/vim-ruby'

NeoBundle 'buftabs'
NeoBundle 'endwise.vim'
NeoBundle 'FuzzyFinder'
NeoBundle 'L9'

filetype plugin indent on
NeoBundleCheck

set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8
set backupdir=~/Dropbox/succi0303/lib/vim_backup
set directory=~/Dropbox/succi0303/lib/vim_backup
set expandtab
set smarttab
set autoindent
set tabstop=2 shiftwidth=2 softtabstop=2
set cursorline
set number
set showmatch
set incsearch

" 検索結果のハイライトをEsc連打でクリア
nnoremap <ESC><ESC> :nohlsearch<CR>

" コマンドラインモードの補完を有効
set wildmode=longest:full,full

" grep検索設定
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" カラースキーマ
colorscheme railscasts

" プラグイン

"" bufexplorer
nmap <C-l> :BufExplorer<CR>

"" neocomplecache
let g:neocomplcache_enable_at_startup=1
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug><neocomplcache_snippets_expand)
let g:neocomplcache_snippets_dir='~/Dropbox/succi0303/lib/vim_neocomplcache_snippets'

" unite
let g:unite_enable_start_insert=1
nmap <C-o> :Unite line<CR>
nmap <C-u> :Unite file_mru buffer file<CR>

" indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_color_change_percent=30
let g:indent_guides_guide_size=1

" open-browser
let g:netw_nogx=1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" vim-quickrun
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
                        \ 'command' : 'bluecloth',
                        \ 'exec' : '%c -f %s'
                        \ }
