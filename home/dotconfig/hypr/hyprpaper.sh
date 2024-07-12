#!/bin/sh
hyprctl dispatch exec hyprpaper
sleep 3
hyprctl hyprpaper preload "~/.dotfiles/home/dotconfig/hypr/wallpapers/nix.png"
hyprctl hyprpaper preload "~/.dotfiles/home/dotconfig/hypr/wallpapers/nix-vert.png"
sleep 3
hyprctl hyprpaper wallpaper "DP-1,~/.dotfiles/home/dotconfig/hypr/wallpapers/nix.png"
hyprctl hyprpaper wallpaper "DP-2,~/.dotfiles/home/dotconfig/hypr/wallpapers/nix-vert.png"
hyprctl hyprpaper wallpaper "DP-3,~/.dotfiles/home/dotconfig/hypr/wallpapers/nix.png"
hyprctl hyprpaper wallpaper "HDMI-A-1,~/.dotfiles/home/dotconfig/hypr/wallpapers/nix.png"
