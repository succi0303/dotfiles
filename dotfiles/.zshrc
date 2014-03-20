# cdコマンドのサーチパス
cdpath=(.. ~ ~/src ~/zsh)

# autoloadされる関数を検索するパス
fpath=($fpath ~/.zfunc)

# manマニュアルの配置されているパス
manpath=($X11HOME/man /usr/man /usr/lang/man /usr/local/man)

# sbin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/sbin

# 文字コード
export LANG=ja_JP.UTF-8

# デフォルトのパーミッション設定
# 新規ファイルは644 新規ディレクトリは755
umask 022

# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

# zshオプション
setopt notify globdots correct pushdtohome cdable_vars autolist
setopt correctall auto_cd recexact longlistjobs
setopt auto_pushd pushdminus extended_glob
setopt list_packed list_types
setopt hist_no_store hist_ignore_dups hist_reduce_blanks hist_ignore_space inc_append_history share_history
setopt no_beep

# zshモジュールのロード
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

# キーバインド
bindkey -e

# 補完機能
autoload -U compinit
compinit

# 補完関数の表示を強化する
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT
# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

# 履歴
HISTSIZE=2000
SAVEHIST=1000000
HISTFILE=~/.zhistory
DIRSTACKSIZE=20

# プロンプトの設定
autoload -U colors
colors
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# エイリアス
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'
alias grep=egrep
alias ls='ls -GwF'
alias ll='ls -l'
alias la='ls -a'
alias lsa='ls -al'

alias be='bundle exec'

alias bnew='bookmark new'
alias bls='bookmark ls'
alias bed='bookmark edit'

# 外部ツール設定
## z
_Z_CMD=j
source /usr/local/bin/z.sh
precomd() {
  _z --add "$(pwd -P)"
}

## auto-fu
if [ -f ~/.zsh/auto-fu.zsh/auto-fu.zsh ]; then
  source ~/.zsh/auto-fu.zsh/auto-fu.zsh
  function zle-line-init() {
    auto-fu-init
  }
  zle -N zle-line-init
  zstyle ':completion:*' completer _oldlist _complete
fi

## tmux (auto start)
is_screen_running() {
  [ ! -z "$WINDOW" ]
}
is_tmux_running() {
  [ ! -z "$TMUX" ]
}
is_screen_or_tmux_running() {
  is_screen_running || is_tmux_running
}
shell_has_started_interactively() {
  [ ! -z "$PS1" ]
}
resolve_alias() {
  cmd="$1"
  while \
    whence "$cmd" >/dev/null 2>/dev/null \
    && [ "$(whence "$cmd")" != "$cmd" ]
  do
    cmd=$(whence "$cmd")
  done
  echo "$cmd"
}
if ! is_screen_or_tmux_running && shell_has_started_interactively; then
  for cmd in tmux tscreen screen; do
    if whence $cmd >/dev/null 2>/dev/null; then
      $(resolve_alias "$cmd")
      break
    fi
  done
fi

## rbenv
if [ -d ${HOME}/.rbenv ] ; then
  export PATH="$HOME/.rbenv/bin":$PATH
  eval "$(rbenv init -)"
fi

## grep
# GREP_OPTIONS="--color=always";export GREP_OPTIONS

## vim
export EDITOR="/usr/local/bin/vim"
alias vi="/usr/local/bin/vim"
alias vim="/usr/local/bin/vim"

## my script
export PATH="$HOME/scripts":$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Powerline-shell
function powerline_precmd() {
  export PS1="$(~/.zsh/Powerline-shell/powerline-shell.py --mode flat $? --shell zsh 2> /dev/null)"
}
function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}
install_powerline_precmd

### PostgresSQL
PATH="/Applications/Postgres93.app/Contents/MacOS/bin/:$PATH"

### Git
DYLD_LIBRARY_PATH="/Applications/redmine-2.4.2-0/common/lib/libiconv.2.dylib"

### Apache Jena
export JENAROOT="/Users/succi0303/apache-jena-2.11.1/"
export PATH=$PATH:$JENAROOT/bin
