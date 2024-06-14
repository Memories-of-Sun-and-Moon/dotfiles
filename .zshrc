################################################################################
# zsh settings
################################################################################

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extended_history
setopt hist_ignore_dups
bindkey -e

zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# spell complete
setopt correct

################################################################################
# aliases
################################################################################

# git
alias ga='git add'
alias gc='git commit -m'
alias gst='git status'

# lsd
alias l='lsd -l'
alias la='lsd -a'

# python
alias python='python3'
alias pip='python3 -m pip'

################################################################################
# utilities
################################################################################

# show directory infomations after `cd`
chpwd() { pwd && lsd }

# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="$HOME/dotfiles/starship.toml"

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
