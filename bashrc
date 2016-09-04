#====# Ludee's bashrc #====#

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Turn on 256 color support...
if [ "x$TERM" = "xxterm" ]
then
    export TERM="xterm-256color"
fi

#PATH INSERTIONS
export PATH="/usr/local/android-studio/bin:$PATH"

# Custom PS1
#export PS1="\[\033[38;5;226m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h : \w\n >> \[$(tput sgr0)\]"
#Replaced By Git Function

#Add a Fortune in the beginning
fortune

#====# Functions #====#

#Runs ls always after running cd
function cd {
    builtin cd "$@" && ls
    }

#Gives the date
function today {
    echo "Today's date is:"
    date +"%A, %B %-d, %Y"
}

#GIT
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
function _prompt_command() {
    PS1="`_git_prompt`"'\[\033[38;5;226m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h : \w\n >> \[$(tput sgr0)\]'
}
PROMPT_COMMAND=_prompt_command
