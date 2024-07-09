if status is-interactive
    # Commands to run in interactive sessions can go here
end

###############
### ALIASES ###
###############

alias vim='/home/bertrand/Code/nvim-linux64/bin/nvim'
alias we='curl -s https://wttr.in'
alias less="bat"
alias ll="exa -lah -t modified"
alias ls="exa"

# GIT
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -m'
alias gca='git commit -am'
alias gd='git diff --color-words'
alias gl="git log --graph --all --decorate --pretty=format:'''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset'''"
alias glo='git log --graph --decorate --all'
alias gpl='git pull'
alias gpls='gpl && gps'
alias gs='git status'
alias gcl='git clone --depth=1'
alias gco='git checkout'
alias gr='git reset HEAD'
alias got='cd (git rev-parse --show-toplevel)'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpsup='git push --set-upstream origin (git branch --show-current)'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

# >>> coursier install directory >>>
export PATH="$PATH:/home/bertrand/.local/share/coursier/bin"
# <<< coursier install directory <<<

export PATH="$PATH:~/.ghcup/bin"

# =============================================================================
# Utility functions for zoxide.

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd
    builtin pwd -L
end

# A copy of fish's internal cd function. This makes it possible to use
# `alias cd=z` without causing an infinite loop.
if ! builtin functions -q __zoxide_cd_internal
    if builtin functions -q cd
        builtin functions -c cd __zoxide_cd_internal
    else
        alias __zoxide_cd_internal='builtin cd'
    end
end

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd
    __zoxide_cd_internal $argv
end

# =============================================================================
#
# Hook configuration for zoxide.
#

# Initialize hook to add new entries to the database.
function __zoxide_hook --on-variable PWD
    test -z "$fish_private_mode"
    and command zoxide add -- (__zoxide_pwd)
end

# =============================================================================
#
# When using zoxide with --no-aliases, alias these internal functions as
# desired.
#

# Jump to a directory using only keywords.
function __zoxide_z
    set argc (count $argv)
    if test $argc -eq 0
        __zoxide_cd $HOME
    else if test "$argv" = -
        __zoxide_cd -
    else if test $argc -eq 1 -a -d $argv[1]
        __zoxide_cd $argv[1]
    else
        set -l result (command zoxide query --exclude (__zoxide_pwd) -- $argv)
        and __zoxide_cd $result
    end
end

# Completions for `z`.
function __zoxide_z_complete
    set -l tokens (commandline -op)
    set -l curr_tokens (commandline -cop)

    if test (count $tokens) -le 2 -a (count $curr_tokens) -eq 1
        # If there is only one argument, use `cd` completions.
        __fish_complete_directories "$tokens[2]" ''
    else
        # Otherwise, use interactive selection.
        set -l query $tokens[2..-1]
        set -l result (_ZO_FZF_OPTS='--bind=ctrl-z:ignore --exit-0 --height=35% --inline-info --no-sort --reverse --select-1' zoxide query -i -- $query)
        and commandline -p "$tokens[1] "(string escape $result)
        commandline -f repaint
    end
end

# Jump to a directory using interactive search.
function __zoxide_zi
    set -l result (command zoxide query -i -- $argv)
    and __zoxide_cd $result
end

# NVM
nvm use v18.17.1 > /dev/null
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# =============================================================================
#
# Convenient aliases for zoxide. Disable these using --no-aliases.
#

# Remove definitions.
function __zoxide_unset
    set --erase $argv >/dev/null 2>&1
    abbr --erase $argv >/dev/null 2>&1
    builtin functions --erase $argv >/dev/null 2>&1
end

__zoxide_unset z
alias z=__zoxide_z
complete -c z -e
complete -c z -f -a '(__zoxide_z_complete)'

__zoxide_unset zi
alias zi=__zoxide_zi

zoxide init fish | source
