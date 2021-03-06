#===============# Ludee's Aliases #==============#

#-----
# Most Used
alias v='vim'

#-----
# Just For Fun
alias starwars='telnet towel.blinkenlights.nl'

#-----
# Self-Explanatory
alias o='thunar'
alias q='exit'
alias c='clear'
alias ..='cd ..'
alias .='tree .'

#-----
# Color Related
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#-----
# ls options aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#-----
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
