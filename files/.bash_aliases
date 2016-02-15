# quick navigation
alias roverroot="cd ~/code/rover/web/src/aplaceforrover"
alias rr="roverroot"
alias roverweb="cd ~/code/rover/web"
alias rw="roverweb"
alias cd..="cd .." # because i fail

alias dotfilesroot="cd ~/code/personal/dotfiles"
alias dfr="dotfilesroot"

# fancy lists
alias ls="ls -lhF"       # always show in list form
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
alias reload="exec $SHELL -l"   # reload shell, with updated bash profile, etc.

# afk
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# badges?!
alias badge="tput bel"
