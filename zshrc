export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git
    fast-syntax-highlighting
    zsh-autosuggestions
    zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

