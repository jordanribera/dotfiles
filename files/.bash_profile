# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#### Platform ####

PLATFORM=`uname -s` # "Linux" / "Darwin"

if [ $PLATFORM == 'Linux' ]; then

    # Linux

    # enable color support of ls and also add handy aliases
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls -lhF --color=auto'
        #alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'

        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi

    export AFK_COMMAND="gnome-screensaver-command -l"

elif [ $PLATFORM == 'Darwin' ]; then

    # Mac OS
    export AFK_COMMAND="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

    # enable terminal colors
    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagaced

    #if [ "$TERM" = xterm ]; then TERM=xterm-256color; fi

fi

#### Universal ####

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# default editor
VISUAL=vim
EDITOR=vim
set -o vi


# define colors
if [ -f ~/.bash_colors ]; then
    source ~/.bash_colors
fi

# define functions
if [ -f ~/.bash_functions ]; then
    source ~/.bash_functions
fi

# define aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# define prompt
if [ -f ~/.bash_prompt ]; then
    source $HOME/.bash_prompt
fi

# define welcome
if [ -f ~/.bash_welcome ]; then
    source $HOME/.bash_welcome
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
