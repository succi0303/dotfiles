" vim-plug
call plug#begin('~/.vim/autoload/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'cohama/lexima.vim'
Plug 'chriskempson/base16-vim'
Plug 'easymotion/vim-easymotion'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'kannokanno/previm'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tyru/open-browser.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

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
colorscheme Tomorrow-Night-Blue
syntax on

" プラグイン

" fzf.vim
nnoremap <C-g>f :Files<CR>
nnoremap <C-g>b :Buffers<CR>
nnoremap <C-g>l :BLines<CR>
nnoremap <C-g>L :Lines<CR>
nnoremap <C-g>g :GFiles<CR>
nnoremap <C-g>G :GFiles?<CR>
nnoremap <C-g>c :BCommits<CR>
nnoremap <C-g>C :Commits<CR>

" goyo.vim
function! s:goyo_enter()
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    set noshowmode
    set noshowcmd
    set scrolloff=999
    colorscheme Tomorrow
    Limelight
endfunction

function! s:goyo_leave()
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    set showmode
    set showcmd
    set scrolloff=5
    colorscheme Tomorrow-Night-Blue
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" limelight.vim
let g:limelight_conceal_ctermfg='gray'
let g:limelight_concieal_guifg='DarkGray'
let g:limelight_default_coefficient = 0.5
let g:limelight_paragraph_span=0

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
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#formatter='default'
"let g:airline_powerline_fonts=1
"let g:airline_symbols_ascii=1
if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif

" NERD-Tree
let g:NERDTreeShowHidden=1
let g:NERDTreeMapActivateNode="<CR>"
let file_name = expand("%:p")
nnoremap <C-e> :NERDTreeToggle<CR>
