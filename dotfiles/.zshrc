# cdコマンドのサーチパス
cdpath=(.. ~ ~/src ~/zsh)

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
autoload -Uz add-zsh-hook
autoload -U colors
colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|br):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

autoload -Uz is-at-least
if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "(staged)"
  zstyle ':vcs_info:git:*' unstagedstr "(unstaged)"
  zstyle ':vcs_info:git:*' formats '(%s)-[%b]%c%u '
  zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a]%c%u '
fi

function _update_vcs_info_msg() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

add-zsh-hook precmd _update_vcs_info_msg
PROMPT="%{$fg[cyan]%}%n@%m$%{${reset_color}%} %1(v|%F{red}%1v%f|)
> "
RPROMPT="%{$fg[cyan]%}[%~]%{${reset_color}%}"

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

alias nvim='docker run -it --rm -v $(pwd):/usr/src/nvim:cached -v ~/.gitconfig:/root/.gitconfig succi0303/my-neovim'

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

## zsh-completions
if [ -d ~/.zsh/zsh-completions ] ; then
  fpath=(~/.zsh/zsh-completions/src $fpath)
  compinit
fi

## vim
if builtin command -v /usr/local/bin/vim > /dev/null; then
  export EDITOR="/usr/local/bin/vim"
  alias vi="/usr/local/bin/vim"
  alias vim="/usr/local/bin/vim"
fi

## Heroku toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## peco & ghq
function peco-ghq () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ] ; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-ghq
bindkey '^]' peco-ghq

## ssh-agent
if [ -e ~/.ssh-agent-info ] ; then
  source ~/.ssh-agent-info
fi
ssh-add -l >&/dev/null
if [ $? = 2 ] ; then
  echo "ssh-agent: restart."
  ssh-agent >~/.ssh-agent-info
  source ~/.ssh-agent-info
fi
if ssh-add -l >&/dev/null ; then
  echo "ssh-agent: Identity is already stored."
else
  ssh-add
fi
