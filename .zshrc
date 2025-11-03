# Zsh History Configuration
export HISTFILE="~/.zsh_history"        # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# Autocompletion
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

# Gitit
source $DOTFILES/gitit.zsh
