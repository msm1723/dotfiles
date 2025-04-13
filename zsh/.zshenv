#!/bin/zsh
#
# Is the first Zsh startup file that gets sourced for every (non-login) invocation of Zsh.
# It’s commonly used to set up environment variables that should be available everywhere—regardless of whether you’re opening a login shell or a non-login shell.
#

# Add some paths
#export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/Users/user/bin:/usr/local/sbin:$PATH"

# Tells everyone who needs to know which editor to be used
export EDITOR="nvim"

# Tells Zsh where to look for its dotfiles (.zshrc, .zprofile, etc.) instead of in the default ~.
export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

# XDG - X Desktop Group, a collection of standards for file and directory locations, with the goal of improving the organization and consistency of user data across various applications.
# XDG defines a set of environment variables that guide applications to place their files in specific directories separated into categories: config, data, cache, and state.
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/.xdg}
export XDG_PROJECTS_DIR=${XDG_PROJECTS_DIR:-$HOME/Projects}

# Fish-like dirs
: ${__zsh_config_dir:=${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}}
: ${__zsh_user_data_dir:=${XDG_DATA_HOME:-$HOME/.local/share}/zsh}
: ${__zsh_cache_dir:=${XDG_CACHE_HOME:-$HOME/.cache}/zsh}

# Ensure Zsh directories frome abobe   exist.
() {
  local zdir
  for zdir in $@; do
    [[ -d "${(P)zdir}" ]] || mkdir -p -- "${(P)zdir}"
  done
} __zsh_{config,user_data,cache}_dir XDG_{CONFIG,CACHE,DATA,STATE}_HOME XDG_{RUNTIME,PROJECTS}_DIR

# Make Terminal.app behave.
# This environment variable is specific to Apple’s Terminal.app. Disabling shell sessions can prevent Apple’s Terminal from storing or restoring shell sessions in some scenarios.
if [[ "$OSTYPE" == darwin* ]]; then
  export SHELL_SESSIONS_DISABLE=1
fi
