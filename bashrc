#===============# Ludee's bashrc #===============#

#================================================#
# If not running interactively don't do anything #
#================================================#

[ -z "$PS1" ] && return

#================================================#
# PATH Insertions and other Environmental tweaks #
#================================================#

if [ -f ~/bin/functions.sh ]; then
    source ~/bin/functions.sh
else
    echo "No Personnal functions sourced"
fi

export PATH=$HOME/bin:/usr/local/bin:/usr/local/android-studio/bin:$PATH
export LANG=en_US.UTF-8

shopt -s histappend
shopt -s checkwinsize

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
HISTIGNORE="&:ls:ls *:exit"

#================================================#
# Colors                                         #
#================================================#

export TERM="xterm-256color"

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#================================================#
# Greeting, Prompt                               #
#================================================#

#if [ -x /usr/games/fortune ]; then
#    /usr/games/fortune -so
#fi
today
#See Functions for prompt detail
PROMPT_COMMAND=_prompt_command

#================================================#
# Alias                                          #
#================================================#

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#================================================#
# Functions                                      #
#================================================#

#Git
function _git_prompt() {
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local ansi=42
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local ansi=43
        else
            local ansi=45
        fi
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch=${BASH_REMATCH[1]}
            test "$branch" != master || branch=' '
        else
            # Detached HEAD.  (branch=HEAD is a faster alternative.)
            branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
                echo HEAD`)"
        fi
        echo -n '\[\e[0;37;'"$ansi"';1m\]'"$branch"'\[\e[0m\] '
    fi
}

#Prompt
function _prompt_command() {
    PS1="`_git_prompt`"'\[\033[38;5;226m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h : \w\n $ \[$(tput sgr0)\]'
}

#================================================#
