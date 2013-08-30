# cdコマンドのサーチパス
cdpath=(.. ~ ~/src ~/zsh)

# autoloadされる関数を検索するパス
fpath=($fpath ~/.zfunc)

# manマニュアルの配置されているパス
manpath=($X11HOME/man /usr/man /usr/lang/man /usr/local/man)

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

# 履歴
HISTSIZE=2000
SAVEHIST=1000000
HISTFILE=~/.zhistory
DIRSTACKSIZE=20

# プロンプトの設定
autoload -U colors
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' actionformats '%b|%a'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [ -n "$vcs_info_msg_0_" ] && psvar[1]="$vcs_info_msg_0_"
}
PROMPT="%F{240}zsh>%f "
RPROMPT="%F{063}%1(v|%1v|)%f %F{240}%~%f"
setopt transient_rprompt

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

## rbenv
export PATH="$HOME/.rbenv/bin":$PATH
eval "$(rbenv init -)"

## grep
GREP_OPTIONS="--color=always";export GREP_OPTIONS

## MacVim
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim'


