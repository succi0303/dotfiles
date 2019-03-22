setopt IGNOREEOF
export LANG=ja_JP.UTF-8

export PATH=$PATH:/sbin
export PATH=$PATH:/usr/sbin

autoload -Uz colors
colors

autoload -Uz compinit
compinit

bindkey -e

setopt share_history
setopt histignorealldups
HISTSIZE=2000
SAVEHIST=1000000
HISTFILE=~/.zhistory
DIRSTACKSIZE=20

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct

stty erase ^H
bindkey "^[[3~" delete-char

autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars "_-./:@"
zstyle ':zle:*' word-style unspecified

setopt no_flow_control

zstyle ':completion:*:default' menu select
setopt menu_complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^p' history-beginning-search-backward-end
bindkey '^b' history-beginning-search-forward-end

autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-default true

# alias
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

# vim
if builtin command -v /usr/local/bin/vim > /dev/null; then
  export EDITOR="/usr/local/bin/vim"
  alias vi="/usr/local/bin/vim"
  alias vim="/usr/local/bin/vim"
fi

# Heroku toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# plugin
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

## anyframe
export FZF_DEFAULT_OPTS="--extended --cycle --ansi --select-1 --reverse"
zstyle ":anyframe:selector:" use fzf-tmux
bindkey '^gr' anyframe-widget-cd-ghq-repository
bindkey '^gh' anyframe-widget-put-history
bindkey '^gk' anyframe-widget-kill
bindkey '^gb' anyframe-widget-insert-git-branch
bindkey '^gc' anyframe-widget-cdr


## ssh-agent
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent lifetime 48h
