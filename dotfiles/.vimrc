" dein.vim
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/bundle/dein.vim

if dein#load_state(expand('~/.vim/bundle'))
  call dein#begin(expand('~/.vim/bundle'))

  call dein#load_toml(expand('~/.dein.toml'), {'lazy': 0})
  call dein#load_toml(expand('~/.dein_lazy.toml'), {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set backspace=indent,eol,start
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

" インデント
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
set smartindent
augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.coffee setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.yml,*.yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

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
colorscheme one-dark
syntax on

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

" VimFiler
nnoremap <silent> mf :<C-u>VimFiler<CR>
nnoremap <silent> mF :<C-u>VimFilerBufferDir<CR>

" VimShell
nnoremap <silent> ms :<C-u>VimShell<CR>
nnoremap <silent> mS :<C-u>VimShellBufferDir<CR>
nnoremap <silent> mp :<C-u>VimShellPop<CR>

" unite
let g:unite_enable_start_insert=0
let g:unite_enable_ignore_case=1
let g:unite_enable_smart_case=1
nnoremap <silent> ,l :<C-u>Unite line<CR>
nnoremap <silent> ,b :<C-u>Unite buffer<CR>
nnoremap <silent> ,t :<C-u>Unite tab<CR>
nnoremap <silent> ,f :<C-u>Unite file_mru<CR>
nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,r :<C-u>UniteResume search-buffer<CR>
nnoremap <silent> ,B :<C-u>Unite bookmark<CR>
nnoremap <silent> ,F :<C-u>Unite file<CR>

" open-browser
let g:netw_nogx=1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" vim-easymothon
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1
" <Leader>f{char} to move to {char}
map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" <Leader>s{char}{char} to move to {char}{char}
map <Leader>s <Plug>(easymotion-bd-f2)
nmap <Leader>s <Plug>(easymotion-overwin-f2)
" Move to Line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" n-character search
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
"hjkl
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>n <Plug>(easymotion_linebackward)

" airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extentions#tabline#show_buffers=0
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#tabline#fnamemod=":t"

let g:airline_theme='one'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" powerline symbols
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" JpFormat
set formatexpr=jpfmt#formatexpr()

" vim-smartinput-endwise
call smartinput_endwise#define_default_rules()

" syntastic
let g:syntastic_auto_loc_list=0

" NERD-Tree
let g:NERDTreeShowHidden=1
let g:NERDTreeMapActivateNode="<CR>"
let file_name = expand("%:p")
nnoremap <C-e> :NERDTreeToggle<CR>

" vim-indent-guides
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=gray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgray
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

" qfixhowm
let my_howm_dir = expand('~/.ghq/bitbucket.org/succi0303/howm')
if isdirectory(my_howm_dir)
    let howm_dir = my_howm_dir
    let howm_fileencoding = 'utf-8'
    let howm_fileformat = 'unix'
    let QFixWin_EnableMode = 1
    let QFix_UseLocationList = 1
    let howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.md'
    let QFixHowm_FileType = 'markdown'
    let QFixHowm_Title = '#'
    let QFixHowm_Template = [
      \"# %TAG%",
      \""
      \]
    let QFixHowm_SaveTime = -1
    let QFixMRU_Entries = 50
endif

" simplenote.vim
if filereadable($HOME . '/.simplenoterc')
  source ~/.simplenoterc
endif

" vimoutliner and more.
" 連続インデント
vnoremap < <gv
vnoremap > >gv
" 選択領域の上下移動
function! s:move_block(d) range
  let cnt = a:lastline - a:firstline
  if a:d ==# 'u'
    let sign = '-'
    let cnt = 2
  else
    let sign = '+'
    let cnt += 1
  endif
  execute printf('%d,%dmove%s%d', a:firstline, a:lastline, sign, cnt)
endfunction
vnoremap <C-n> :call <SID>move_block('d')<Cr>==gv
vnoremap <C-p> :call <SID>move_block('u')<Cr>==gv
" foldCC
set foldtext=FoldCCtext()
" vim-partedit
vnoremap <C-l> :Partedit<CR>
noremap <C-h> :ParteditEnd<CR>
