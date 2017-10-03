#===============# Ludee's bashrc #===============#

#================================================#
# If not running interactively don't do anything #
#================================================#

[ -z "$PS1" ] && return

#================================================#
# PATH Insertions and other Environmental tweaks #
#================================================#

export PATH=$HOME/bin:/usr/local/bin:$PATH
export LANG=en_US.UTF-8

shopt -s histappend
shopt -s checkwinsize

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
HISTIGNORE="&:ls:ls *:exit"

export VISUAL=vim
export EDITOR="$VISUAL"
set -o vi

#================================================#
# Colors                                         #
#================================================#

export TERM="screen-256color"
export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h\$(parse_git_branch)\[\033[00m\]: \w\n $\[$(tput sgr0)\]"

#================================================#
# Greeting, Prompt                               #
#================================================#

#if [ -x /usr/games/fortune ]; then
#    /usr/games/fortune -so
#fi

if [ -f ~/bin/ludee_functions.sh ]; then
    source ~/bin/ludee_functions.sh
    today
else
    echo "No Personnal functions sourced"
fi

#================================================#
# Alias                                          #
#================================================#

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/dotfiles/bash_aliases_personal ]; then
    source ~/dotfiles/bash_aliases_personal
fi

#================================================#
# Functions                                      #
#================================================#

#================================================#

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PATH="$HOME/git_repos/rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/git_repos/rbenv/plugins/ruby-build/bin:$PATH"
