# -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
# Created by:shravanbharatdoda@gmail.com |
# -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.



############################### GENERAL SETTINGS ###############################
 
# Aliases
# alias ls=eza
alias vim=nvim

## Git Aliases 
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gb='git branch'
alias gl='git log'
alias gd='git diff'
alias gcl='git clone'
alias gst='git stash'
alias gpo='git push origin'
alias gplo='git pull origin'


# History
HISTSIZE=5000
HISTFILE=~/.zsh-history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups



############################### ZINIT SETTINGS ###############################

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.config}/zinit/zinit.git"

# Download the ZINIT, if it's not there already
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load Zinit
source "${ZINIT_HOME}/zinit.zsh"


############################### PLUGIN SETTINGS ###############################

# Syntax Highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Autocomplete
zinit light zsh-users/zsh-completions

# Autosuggestions
zinit light zsh-users/zsh-autosuggestions

# Substring search
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# FZF Tab
zinit light Aloxaf/fzf-tab


############################### COMPLETION SETTINGS ###############################
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'


############################### STARHIP SETTINGS ###############################

# Starship configuration
eval "$(starship init zsh)"

############################### FZF SETTINGS ###############################


eval "$(fzf --zsh)"

function detect-columns() nu -c 'cat | detect columns'

fpath+=~/.zfunc; autoload -Uz compinit; compinit
export PATH="$HOME/.local/bin:$PATH"
