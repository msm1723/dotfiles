#!/bin/zsh

# =========================================================
# Brew init
# =========================================================
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# =========================================================
# GPG
# =========================================================
[[ -n "$TTY" ]] && export GPG_TTY="$TTY"

# =========================================================
# Tmux
# =========================================================
# Always work in a tmux session if Tmux is installed
if which tmux >/dev/null 2>&1; then
  # Check if the current environment is suitable for tmux
  if [[ -z "$TMUX" &&
    $TERM != "screen-256color" &&
    $TERM != "screen" &&
    -z "$VSCODE_INJECTION" &&
    -z "$VIM" ]]; then
    # Try to attach to the default tmux session, or create a new one if it doesn't exist
    tmux attach -t default >/dev/null 2>&1 || tmux new -s default
    exit
  fi
fi

# =========================================================
# Starship
# =========================================================
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
eval "$(starship init zsh)"

# =========================================================
# History
# =========================================================
mkdir -p -- "${HISTFILE:h}"
touch -- "$HISTFILE"

HISTSIZE=1000000
SAVEHIST=1000000

setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt APPEND_HISTORY

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

unsetopt INC_APPEND_HISTORY
unsetopt INC_APPEND_HISTORY_TIME

# =========================================================
# Shell behaviour
# =========================================================
setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT # sort file10 after file9, not after file1

# =========================================================
# Eza Style
# =========================================================
zstyle ':omz:plugins:eza' 'dirs-first' yes
zstyle ':omz:plugins:eza' 'git-status' yes
zstyle ':omz:plugins:eza' 'header' yes
zstyle ':omz:plugins:eza' 'icons' yes

# =========================================================
# Smart directory navigation
# =========================================================
eval "$(zoxide init zsh)"

# =========================================================
# fzf
# =========================================================
export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix' # strip-cwd-prefix removes the leading ./ from results

# Ctrl-T uses fd
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# UI
export FZF_DEFAULT_OPTS='
  --height=60%
  --layout=reverse
  --border=rounded
  --prompt="  "
  --pointer="  "
  --preview-window=right:65%:wrap:border-left
'

export _FZF_PREVIEW_CMD='bat --color=always --style=plain,numbers --line-range=:500 {}'
export FZF_CTRL_T_OPTS="--preview '$_FZF_PREVIEW_CMD'"

# =========================================================
# Antidote plugin manager
# =========================================================
# Clone Antidote if necessary
[[ -e ${ZDOTDIR:-~}/.antidote ]] || git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

# Load Antidote
source "${ZDOTDIR:-$HOME}/.antidote/antidote.zsh"
antidote load "$ZDOTDIR/.zsh_plugins.txt"

# =========================================================
# Environment
# =========================================================
export PINENTRY_USER_DATA="USE_CURSES=1" # Tell the pinentry program dialog programs to use the nice, full-screen pinentry program
export LC_ALL='en_US.UTF-8'              # mc cyrillic issue solved (:

# =========================================================
# Aliases
# =========================================================
# Reload zshell rcconfiguration
alias reload=". ${ZDOTDIR:-~}/.zshrc"

# System
alias shutdown='sudo shutdown now'
alias restart='sudo reboot'
alias sleep='pmset sleepnow'
alias c='clear'
alias e='exit'

# Reattach to session or create new
alias tt="tmux attach || tmux new -s default"

# nvim
alias n="nvim"
alias vim="nvim"
alias vi="nvim"

# Interactive remove by default
alias rm='rm -i'
alias mv='mv -i'

# myip, FQDN
alias myip="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias fqdn="host $(hostname)"

# rsync
alias rsynk="rsync -avzhP"

# Docker
alias drmi="docker image prune"
alias drm="docker ps -aq | xargs docker stop | xargs docker rm && docker network prune -f && docker volume prune -f && docker image prune -f"
dockershell() {
  if (($# < 1)); then
    echo 'Usage: dsh <container-id> [sh]'
    return 1
  fi

  local shell_type='/bin/bash'

  if [[ "$2" == 'sh' ]]; then
    shell_type='/bin/sh'
  fi

  docker exec -it "$1" "$shell_type"
}
alias dsh='dockershell'

# Dated history
unalias history 2>/dev/null
function history {
  fc -t '%Y-%m-%d %T:' -il 1
}

# Disable mc use of the concurrent shel (fast load)
alias mc='mc --nosubshell'

# Zoxide
alias j='z'
alias jj='zi'

# Total Update
alias uu="yes | bugbc && omz update && antidote update && ya pkg upgrade && nvim --headless \"+Lazy! sync\" +qa && ~/.config/tmux/plugins/tpm/bin/update_plugins all"

# =========================================================
# Yazi
# =========================================================
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# =========================================================
# NVM - Node multiple versions support
# =========================================================
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
