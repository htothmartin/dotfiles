#!/bin/sh

WALLPAPER_DIR="${WALLPAPER_DIR:-$HOME/dotfiles/wallpapers}"

feh --bg-fill --randomize --no-fehbg "$WALLPAPER_DIR"

