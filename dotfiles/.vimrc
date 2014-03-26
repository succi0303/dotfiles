" neobundle

set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'bling/vim-airline'
NeoBundle 'cohama/vim-smartinput-endwise'
NeoBundle 'deton/jasegment.vim'
NeoBundle 'fuenor/JpFormat.vim'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'gregsexton/gitv'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mrtazz/simplenote.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'noahfrederick/vim-hemisu'
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'pentie/VimRepress'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplete'
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
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/VOoM'
NeoBundle 'vimoutliner/vimoutliner'
NeoBundle 'vimwiki/vimwiki'
NeoBundle 'buftabs'

filetype plugin indent on
NeoBundleCheck

set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8
set backupdir=~/.vim_backup
set directory=~/.vim_backup
set expandtab
set smarttab
set backspace=indent,eol,start
set autoindent
set tabstop=2 shiftwidth=2 softtabstop=2
set hidden
set showcmd
set cursorline
set number
set laststatus=2
set showmatch
set incsearch
set display+=lastline
set wildmenu
set ignorecase
set clipboard=unnamed

" crontab編集用
set backupskip=/tmp/*,/private/tmp/*

" ウィンドウ関連
nnoremap s <Nop>
" ウィンドウ分割
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
" ウィンドウ移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
" ウィンドウを閉じる
nnoremap sq :<C-u>q<CR>

" タブ関連
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT
nmap <C-k> :<C-u>Unite tab<CR>
" タブを閉じる
nnoremap sQ :<C-u>tabclose<CR>

" バッファ移動用のキーマッピング
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" 検索結果のハイライトをEsc連打でクリア
nnoremap <ESC><ESC> :nohlsearch<CR>

" コマンドラインモードの補完を有効
set wildmode=list,full

" grep検索設定
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" カラースキーマ
colorscheme hemisu

" プラグイン

" neocomplete
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#sources#syntax#min_keyword_length=3
let g:neocomplete#lock_buffer_name_pattern='\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries={
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'.gosh_completion'
      \ }
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns={}
endif
let g:neocomplete#keyword_patterns['default']='\h\w*'

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#omni#input_patterns')
 let g:neocomplete#sources#omni#input_patterns={}
endif
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

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
nmap <C-o> :Unite line/fast<CR>
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

" EasyBuffer.vim
nnoremap <C-l> :EasyBuffer<CR>
syntax on

" airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extentions#tabline#show_buffers=0
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#tabline#fnamemod=":t"

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

" vim-smartinput-endwise
call smartinput_endwise#define_default_rules()

" syntastic
let g:syntastic_auto_loc_list=0

" NERD-Tree
let g:NERDTreeShowHidden=1
let g:NERDTreeMapActivateNode="<CR>"
let file_name = expand("%:p")
nnoremap <C-e> :NERDTreeToggle<CR>

" simplenote.vim
source ~/.simplenoterc
