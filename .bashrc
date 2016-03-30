# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "`dircolors`"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

PS1="\[\e[0;37m\]┌─[\[\e[0;31m\]\u\[\e[0;37m\]@NomDuServeur:\[\e[0;32m\]\w\[\e[0;37m\]]\[\e[0;36m\]\n\[\e[0;37m\]└─>\[\e[0m\] "
#PS1='\[\e[1;91m\][\u@\h \w]\n\$\[\e[0m\] '

export PATH=$PATH:/usr/games
export PATH=$PATH:/usr/lib/node_modules

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export GREP_OPTIONS='--color=always'

bind "set completion-ignore-case on"
bind "set bell-style none"
#bind "set show-all-if-ambiguous On"

export NVM_DIR="/root/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
