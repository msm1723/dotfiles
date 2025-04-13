#!/bin/zsh

# .zshrc - Run on interactive Zsh session


#======================================
# Antidote plugin manager
#======================================
# Clone Antidote if necessary
[[ -e ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

# FAST Antidote
#source ${ZDOTDIR:-~}/.antidote/antidote.zsh
#antidote load

# ULTRA FAST Antidote
# Set the root name of the plugins files (.txt and .zsh) antidote will use.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins
# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt
# Lazy-load antidote from its functions directory.
fpath=(${ZDOTDIR}/.antidote/functions $fpath)
autoload -Uz antidote
# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi
# Source your static plugins file.
source ${zsh_plugins}.zsh


#======================================
# Starship
#======================================
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml


#======================================
# Tmux
#======================================
# Always work in a tmux session if Tmux is installed
if which tmux >/dev/null 2>&1; then
  # Check if the current environment is suitable for tmux
  if [[ -z "$TMUX" && \
        $TERM != "screen-256color" && \
        $TERM != "screen" && \
        -z "$VSCODE_INJECTION" && \
        -z "$INSIDE_EMACS" && \
        -z "$EMACS" && \
        -z "$VIM" && \
        -z "$INTELLIJ_ENVIRONMENT_READER" ]]; then
    # Try to attach to the default tmux session, or create a new one if it doesn't exist
    tmux attach -t default >/dev/null 2>&1 || tmux new -s default
    exit
  fi
fi


#======================================
# zoxide - a better cd command
#======================================
eval "$(zoxide init zsh)"


#======================================
# Environment
#======================================
export GPG_TTY=$(tty)  # GNUPG encryption ask passphrase in terminal
export PINENTRY_USER_DATA="USE_CURSES=1" # Tell the pinentry program dialog programs to use the nice, full-screen pinentry program
DISABLE_AUTO_TITLE="true"  # Disable auto-setting terminal title for tmux pane
COMPLETION_WAITING_DOTS="true"  # Display red dots whilst waiting for completion.
DISABLE_UNTRACKED_FILES_DIRTY="true"  # Large repo fast status check
HIST_FORMAT="'%Y-%m-%d %T:'$(echo -e '\t')"  # History with time
export LC_ALL='en_US.UTF-8'  # mc cyrillic issue solved (:


#======================================
# Aliases
#======================================
## Reload zshell rcconfiguration
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

# ls
#alias ls='ls -GCF'  # color, multicolumns, filetypes
#alias la='ls -A'  # all files except . and .. (almost all)
#alias l.='ls -d .*'  # only hidden fil
#alias ll='ls -lah'  # long list alphabetical sort
#alias lt='ls -lahtr'  # long list oldest first sort
#alias lz='ls -lahS'  # long list largest first
#alias l='ls -dlh'  # long dir info

# eza
alias l="eza --icons"
alias ls="eza --icons"
alias ll="eza -lg --icons"
alias la="eza -lag --icons"
alias lt="eza -lTg --icons"
alias lt1="eza -lTg --level=1 --icons"
alias lt2="eza -lTg --level=2 --icons"
alias lt3="eza -lTg --level=3 --icons"
alias lta="eza -lTag --icons"
alias lta1="eza -lTag --level=1 --icons"
alias lta2="eza -lTag --level=2 --icons"
alias lta3="eza -lTag --level=3 --icons"

# Interactive remove by default
alias rm='rm -i'
alias mv='mv -i'

# myip, FQDN
alias myip="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias fqdn="host $(hostname)"

# rsync
alias rsynk="rsync -avzhP"

# Homebreow
alias bru="brew upgrade"
alias brug="brew upgrade --greedy"
alias brd="brew doctor"
alias brc="brew cleanup"

# Docker
alias drmi="docker image prune"
alias drm="docker ps -aq | xargs docker stop | xargs docker rm && docker network prune -f && docker volume prune -f && docker image prune -f"
dockershell() {
  if [ "$#" -lt 1 ]; then
    echo "Usage: dshell <container-id> [shell=sh]"
    return 1
  fi
  # Default shell
  SHELL_TYPE="/bin/bash"
  # If the second argument is provided and it is 'shell=sh', use '/bin/sh'
  if [ "$2" = "sh" ]; then
    SHELL_TYPE="/bin/sh"
  fi
  docker exec -it $1 $SHELL_TYPE
}
alias dsh='dockershell'

# Disable mc use of the concurrent shel (fast load)
alias mc='mc --nosubshell'
alias history="fc -t "$HIST_FORMAT" -il 1"


#======================================
# Yazi
#======================================
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

