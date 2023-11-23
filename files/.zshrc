# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jordan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.dotfiles/shell_profile
source ~/.dotfiles/shell_functions
source ~/.dotfiles/shell_aliases
source ~/.dotfiles/shell_welcome
source ~/.dotfiles/shell_prompt
precmd() { eval "$PROMPT_COMMAND" }
