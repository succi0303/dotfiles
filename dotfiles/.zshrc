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

alias nvim='docker run -it --rm -v $(pwd):/root/go/src/nvim:cached -v ~/.gitconfig:/root/.gitconfig -v ~/.ssh:/root/.ssh succi0303/my-neovim'

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

## vim
if builtin command -v /usr/local/bin/vim > /dev/null; then
  export EDITOR="/usr/local/bin/vim"
  alias vi="/usr/local/bin/vim"
  alias vim="/usr/local/bin/vim"
fi

## Heroku toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

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

if [[ ! -d ~/.zplug ]] ; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
zplug "mollifier/anyframe"
zplug "motemen/ghq", as:command, from:gh-r
zplug "rupa/z", use:zsh

if ! zplug check --verbose; then
  printf "Install? [y/N]"
  if read -q; then
    echo; zplug install
  fi
fi

# anyframe
export FZF_DEFALT_OPTS="--extended --cycle --ansi --select-1"
zstyle ":anyframe:selector:" use fzf-tmux
bindkey '^gr' anyframe-widget-cd-ghq-repository
bindkey '^gh' anyframe-widget-put-history
bindkey '^gk' anyframe-widget-kill
bindkey '^gb' anyframe-widget-insert-git-branch

zplug load --verbose
