# quick navigation
alias cd..="cd .." # because i fail

alias personalroot="cd ~/code/personal"
alias pr="personalroot"
alias workroot="cd ~/code/leafly"
alias wr="workroot"

# grepping
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# fancy lists
# alias ls="ls -lhF"       # always show in list form
alias lsa="ls -lahF"     # list with hidden
alias lsh="ls -dF .*"    # list only hidden
alias lf="ls -1F"
alias lfa="ls -1aF"

# fancy path
alias path="echo $PATH | tr -s ':' '\n'"

# human readable sizes
alias du="du -h"

# clear
alias cls="clear"
alias c="clear"

# exit
alias x="exit"
alias :q="exit"     # lazy vim shortcut
alias :wq="exit"    # lazy vim shortcut

# reload terminal
# alias rlc="reload; clear"

# afk
alias afk="$AFK_COMMAND"

# badges?!
alias bell="tput bel"
alias badge="bell"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# ^ example: sleep 10 && alert "done sleeping"

# rcp (rsync copy w/ progress)
alias rcp="rsync -ah --progress"

# folding@home
alias sudo="sudo "
alias fah="/etc/init.d/FAHClient"

# docker workflow
alias dc="docker-compose"
alias dcx="docker-compose exec"

# google cloud
alias gcrfix="gcloud auth print-access-token | docker login -u oauth2accesstoken --password-stdin https://gcr.io"

# looking-glass
alias scry="~/.scripts/looking_glass.sh"

# updates
alias sup="sudo apt update && apt list --upgradable"
alias sug="sudo apt upgrade"

# ruby
alias ugh='export PATH="$HOME/.rbenv/bin:$PATH" && eval "$(rbenv init -)"'

# connectivity
alias stun='~/.scripts/leafly_tunnel.sh'
