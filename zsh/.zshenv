#!/bin/zsh
#
# .zshenv
#
# This is the first Zsh startup file.
# It is sourced for *every* Zsh invocation:
#   - login shells
#   - non-login shells
#   - interactive shells
#   - non-interactive shells
#   - GUI apps (Neovim, launchers, etc.)
#
# It’s commonly used to set up environment variables
# that should be available everywhere.
#
# IMPORTANT:
# Keep this file minimal.
# Only environment variables and very small helpers.
#

# -------------------------------------------------------------------
# PATH
# -------------------------------------------------------------------
# Add system-wide executable paths.
#
# On Intel macOS, Homebrew installs binaries into /usr/local/bin.
# Neovim, LSPs, Treesitter, formatters, DAP, etc. all rely on this.
#
# If a tool is installed but Neovim can't see it,
# PATH is the first thing to check.
if [[ -d /opt/homebrew/bin ]]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
elif [[ -d /usr/local/bin ]]; then
  export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
fi

export PATH="$(brew --prefix rustup)/bin:$HOME/bin:$PATH"
# -------------------------------------------------------------------
# Default editor
# -------------------------------------------------------------------
# Tells programs which editor to use (git, crontab, etc.)
export EDITOR="nvim"

# -------------------------------------------------------------------
# ZDOTDIR
# -------------------------------------------------------------------
# Tells Zsh where to look for its own dotfiles
# (.zshrc, .zprofile, etc.) instead of the default $HOME.
export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

# -------------------------------------------------------------------
# XDG Base Directory Specification
# -------------------------------------------------------------------
# XDG defines standard locations for:
#   - config
#   - cache
#   - persistent data
#   - state
#
# This keeps $HOME clean and predictable.
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/.xdg}
export XDG_PROJECTS_DIR=${XDG_PROJECTS_DIR:-$HOME/Projects}

# -------------------------------------------------------------------
# Fish-like dirs
# -------------------------------------------------------------------
# Zsh-specific directories aligned with XDG.
#
# These use defensive parameter expansion so they still work if:
#   - ZDOTDIR is unset
#   - XDG variables are unset
#   - only $HOME exists
#
# This is intentional and correct for .zshenv.
: ${__zsh_config_dir:=${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}}
: ${__zsh_user_data_dir:=${XDG_DATA_HOME:-$HOME/.local/share}/zsh}
: ${__zsh_cache_dir:=${XDG_CACHE_HOME:-$HOME/.cache}/zsh}

# -------------------------------------------------------------------
# Ensure Zsh and XDG directories exist
# -------------------------------------------------------------------
# Create directories on startup if they don’t exist.
# Safe to run every time.
() {
  local zdir
  for zdir in "$@"; do
    [[ -d "${(P)zdir}" ]] || mkdir -p -- "${(P)zdir}"
  done
} __zsh_{config,user_data,cache}_dir \
  XDG_{CONFIG,CACHE,DATA,STATE}_HOME \
  XDG_{RUNTIME,PROJECTS}_DIR

# -------------------------------------------------------------------
# macOS-specific behavior
# -------------------------------------------------------------------
# This variable is specific to Apple’s Terminal.app.
# Disabling shell sessions prevents Terminal from restoring
# old shell state, which can cause confusing behavior.
if [[ "$OSTYPE" == darwin* ]]; then
  export SHELL_SESSIONS_DISABLE=1
fi

