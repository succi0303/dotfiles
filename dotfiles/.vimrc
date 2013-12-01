" neobundle

set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'bling/vim-airline'
NeoBundle 'deton/jasegment.vim'
NeoBundle 'fuenor/JpFormat.vim'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'gregsexton/gitv'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'honza/vim-snippets'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'pentie/VimRepress'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \ 'mac' : 'make -f make_mac.mak'
      \ },
      \}
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'troydm/easybuffer.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/VOoM'
NeoBundle 'vimoutliner/vimoutliner'
NeoBundle 'buftabs'
NeoBundle 'endwise.vim'

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

" バッファ移動用のキーマッピング
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" 検索結果のハイライトをEsc連打でクリア
nnoremap <ESC><ESC> :nohlsearch<CR>

" コマンドラインモードの補完を有効
set wildmode=longest:full,full

" grep検索設定
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" カラースキーマ
colorscheme lucius
LuciusBlackHighContrast

" プラグイン

" neocomplecache
let g:neocomplcache_enable_at_startup=1

" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" unite
let g:unite_enable_start_insert=1
nmap <C-o> :Unite line<CR>
nmap <C-u> :Unite file_mru buffer file<CR>

" open-browser
let g:netw_nogx=1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" vim-easymothon
let g:EasyMotion_leader_key=";"
let g:EasyMotion_grouping=1

" vim-quickrun
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
                        \ 'command' : 'bluecloth',
                        \ 'exec' : '%c -f %s'
                        \ }

" vimrepress
nnoremap ,bc :BlogNew<CR>
nnoremap ,bl :BlogList<CR>
nnoremap ,bp :BlogPreview publish<CR>

" gist.vim
let g:gist_show_privates=1
let g:gist_post_private=1

" EasyBuffer.vim
nnoremap <C-l> :EasyBuffer<CR>
syntax on

" airline
let g:airline_theme='luna'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" powerline symbols
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" JpFormat
set formatexpr=jpfmt#formatexpr()

" Gitv
autocmd FileType git :setlocal foldlevel=99
