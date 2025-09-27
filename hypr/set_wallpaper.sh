#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/anime-wall"

# Pick a random image file
WALL=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)

# Exit if none found
[ -z "$WALL" ] && echo "No wallpapers found!" && exit 1

# Start swww-daemon if not running
pgrep -x swww-daemon > /dev/null || swww-daemon &

# Wait briefly to ensure swww is ready
sleep 0.5

# Set wallpaper with transition
swww img "$WALL" --transition-type any

# Generate pywal color scheme
wal -i "$WALL"

