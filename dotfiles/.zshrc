setopt IGNOREEOF
export LANG=ja_JP.UTF-8

export PATH=$PATH:/sbin
export PATH=$PATH:/usr/sbin

autoload -Uz colors
colors

bindkey -e

# history

setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_verify
setopt share_history
setopt extended_history
HISTSIZE=2000
SAVEHIST=1000000
HISTFILE=~/.zhistory
DIRSTACKSIZE=20

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^p' history-beginning-search-backward-end
bindkey '^n' history-beginning-search-forward-end

bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

# completion

autoload -Uz compinit
compinit
zstyle ':completion:*' format '%B%F{yellow}%d%f%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' recent-dirs-insert both

setopt menu_complete
setopt no_beep
setopt no_nomatch
setopt prompt_subst

# cdr

autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-default true

# others

setopt correct
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types
setopt no_flow_control
setopt print_eight_bit
setopt rec_exact
setopt auto_remove_slash
setopt complete_in_word
setopt glob
setopt glob_complete
setopt extended_glob
setopt mark_dirs
setopt numeric_glob_sort
setopt magic_equal_subst
setopt always_last_prompt

stty erase ^H
bindkey "^[[3~" delete-char

autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars "_-./:@"
zstyle ':zle:*' word-style unspecified



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
