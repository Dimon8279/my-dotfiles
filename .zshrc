# ------------------------------------------------------------------------------
# Oh My Zsh
# ------------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
HIST_STAMPS="%d.%m.%Y %H:%M"

# ------------------------------------------------------------------------------
# Plugins
# ------------------------------------------------------------------------------
plugins=(git colored-man-pages)
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"

for _p in zsh-autosuggestions zsh-syntax-highlighting; do
    if [[ -d "$ZSH_CUSTOM/plugins/$_p" ]]; then
        plugins+=("$_p")
    fi
done

if (( $+commands[tmux] )); then
    plugins+=(tmux)
fi

source "$ZSH/oh-my-zsh.sh"

# ------------------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------------------

source "$HOME/.zsh/sd-card.zsh"

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------
alias sc='systemctl'
alias sct='systemctl-tui'
alias full-system-upgrade='sudo pacman -Syu && yay && flatpak update'
alias restart-plasma='systemctl --user restart plasma-plasmashell.service'
#alias login='systemctl restart sddm'
alias nosleep='systemd-inhibit --what=sleep:idle --who="me" --why="manual block" --mode=block sleep infinity &'
alias nosleep-off='kill $!'
alias git-tree='tree -a -I ".git"'
alias sp='spotify_player'
alias ff='fastfetch'
alias cl='clear'
#alias ls='nnn -de'

# ------------------------------------------------------------------------------
# Startup
# ------------------------------------------------------------------------------
if [[ -z "$TMUX" ]]; then
    fastfetch
fi

# ------------------------------------------------------------------------------
# Environment
# ------------------------------------------------------------------------------
export PATH="$PATH:$HOME/.spicetify"
