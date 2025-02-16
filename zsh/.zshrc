#!/bin/zsh
#
# .zshrc - Run on interactive Zsh session
#

# Clone antidote if necessary
[[ -e ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

# Antidote
# FAST
#source ${ZDOTDIR:-~}/.antidote/antidote.zsh
#antidote load

# ULTRA FAST
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

# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship.toml

# Reload zshell rcconfiguration
alias reload=${ZDOTDIR:-~}/.zshrc

# Timer settings format
export TIMER_THRESHOLD=0
export TIMER_PRECISION=3
export TIMER_FORMAT='[%d]'

## GNUPG encryption ask passphrase in terminal
GPG_TTY=$(tty)

## Disable auto-setting terminal title for tmux pane
DISABLE_AUTO_TITLE="true"

## Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

## Large repo fast status check
DISABLE_UNTRACKED_FILES_DIRTY="true"

## History with time
HIST_FORMAT="'%Y-%m-%d %T:'$(echo -e '\t')"
alias history="fc -t "$HIST_FORMAT" -il 1"


## Tell the pinentry program to use the nice, full-screen pinentry program:
export PINENTRY_USER_DATA="USE_CURSES=1"

## mc cyrillic issue solved (:
export LC_ALL='en_US.UTF-8'

# Disable mc use of the concurrent shel (fast load)
alias mc='mc --nosubshell'

## Nvim alias
alias n="nvim"
alias vim="nvim"
alias vi="nvim"

## Vi editing mode
#bindkey -v
#export KEYTIMEOUT=1
#bindkey '^P' up-history
#bindkey '^N' down-history
#bindkey '^?' backward-delete-char
#bindkey '^h' backward-delete-char
#bindkey '^w' backward-kill-word
#bindkey '^r' history-incremental-search-backward

## ls aliases
alias ls='ls -GCF' # color, multicolumns, filetypes
alias la='ls -A' # all files except . and .. (almost all)
alias l.='ls -d .*' # only hidden fil
alias ll='ls -lah' # long list alphabetical sort
alias lt='ls -lahtr' # long list oldest first sort
alias lz='ls -lahS' # long list largest first
alias l='ls -dlh' # long dir info

## Interactive by default
alias rm='rm -i'
alias mv='mv -i'

## myip, FQDN
alias myip="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias fqdn="host `hostname`"

## rsync
alias rsynk="rsync -avzhP"

## Reattach to session or create new
alias tt="tmux attach || tmux new -s base"

## Homebreow
alias bru="brew upgrade"
alias brug="brew upgrade --greedy"
alias brd="brew doctor"
alias brc="brew cleanup"

## Docker
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

