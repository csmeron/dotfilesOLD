# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# base themeing (won't typically be seen, but keeping it
# just in case :D)
ZSH_THEME="amuse"


# plugin sourcing
plugins=(git sudo zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh


# aliases
alias omzconf="nvim ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/src/config.zsh"
alias sysinfo="clear && neofetch"
alias py="python3"
alias zshrc="nvim ~/.zshrc"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# changing `ls` colors (var setting)
LS_COLORS="ow=01;36;40" && export LS_COLORS


# final sourcing/prompting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# eval "$(ssh-agent -s)"
eval "$(starship init zsh)"
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
