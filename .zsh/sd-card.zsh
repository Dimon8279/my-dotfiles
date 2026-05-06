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