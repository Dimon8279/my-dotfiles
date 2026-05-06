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
alias full-system-upgrade='sudo xbps-install -Su && flatpak update'
alias nosleep='xset s off && xset -dpms && echo "Sleep inhibited"'
alias nosleep-off='xset s on && xset +dpms && echo "Sleep restored"'
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
