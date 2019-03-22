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

## vim
if builtin command -v /usr/local/bin/vim > /dev/null; then
  export EDITOR="/usr/local/bin/vim"
  alias vi="/usr/local/bin/vim"
  alias vim="/usr/local/bin/vim"
fi

## Heroku toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

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
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "rupa/z", use:zsh

if ! zplug check --verbose; then
  printf "Install? [y/N]"
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose

# anyframe
export FZF_DEFAULT_OPTS="--extended --cycle --ansi --select-1"
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ":anyframe:selector:" use fzf-tmux
bindkey '^gr' anyframe-widget-cd-ghq-repository
bindkey '^gh' anyframe-widget-put-history
bindkey '^gk' anyframe-widget-kill
bindkey '^gb' anyframe-widget-insert-git-branch
bindkey '^gc' anyframe-widget-cdr


# ssh-agent
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent lifetime 48h
