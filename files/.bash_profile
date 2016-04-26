PLATFORM=`uname -s`
if [ $PLATFORM == 'Darwin' ]; then
    source $HOME/code/rover/web/profile
fi

if [ "$TERM" = xterm ]; then TERM=xterm-256color; fi

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# enable osx terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# define prompt
source $HOME/.bash_prompt

# define aliases
source $HOME/.bash_aliases
