# cdコマンドのサーチパス
cdpath=(.. ~ ~/src ~/zsh)

# autoloadされる関数を検索するパス
fpath=($fpath ~/.zfunc /usr/share/zsh/5.0.2/functions)

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
autoload -U promptinit
promptinit
prompt adam1

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{red}%1v%f|)"

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
if [ -d ${HOME}/.rbenv ] ; then
  export PATH="$HOME/.rbenv/bin":"$HOME/.rbenv/shims":$PATH
  eval "$(rbenv init - zsh)"
fi

## vim
export EDITOR="/usr/local/bin/vim"
alias vi="/usr/local/bin/vim"
alias vim="/usr/local/bin/vim"

## Heroku toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## travis gem
if [ -f ${HOME}/.travis/travis.sh ]; then
  source ${HOME}/.travis/travis.sh
fi

## go
export GOPATH=$HOME/.go
export PATH=$PATH:$HOME/.go/bin

## hub
eval "$(hub alias -s)"
compdef hub=git
