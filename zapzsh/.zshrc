# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/sudo"
plug "Aloxaf/fzf-tab"  # Then load fzf-tab
plug "zap-zsh/completions"

# Load and initialise completion system
autoload -Uz compinit
compinit




#Alias
alias ls=lsd
alias Supdate='sudo dnf update'
alias kittythemes='kitty +kitten themes'
alias sourcezsh='source .zshrc'
alias bangers='ncmpcpp'
alias install='sudo dnf install'
alias weeb='ani-cli'
alias search='dnf search'
alias weather='curl wttr.in/Jacksonville FL'
alias remove='sudo dnf remove'



. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"

# ~/.zshrc

eval "$(starship init zsh)"


# PipX
export PATH="${PATH}:$(python3 -c 'import site; print(site.USER_BASE)')/bin"

