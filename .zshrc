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
sd-card() {
    local dev="/dev/mmcblk0p1"

    if [[ ! -b "$dev" ]]; then
        echo "No card found at $dev"
        return 1
    fi

    if mount | grep -q "$dev"; then
        udisksctl unmount -b "$dev" > /dev/null && echo "Card unmounted safely."
    else
        if udisksctl mount -b "$dev" > /dev/null; then
            echo "Card mounted successfully."
            df -h "$dev" | awk 'NR==2 {print "Free space: " $4 " (Total: " $2 ", Used: " $5 ")"}'
        else
            echo "Failed to mount the card."
        fi
    fi
}

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------
alias sc='systemctl'
alias sct='systemctl-tui'
alias restart-plasma='systemctl --user restart plasma-plasmashell.service'
#alias login='systemctl restart sddm'
alias git-tree='tree -a -I ".git"'
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
