#!/bin/sh

# Options for menu
rsn="󱩍 Night light"
rsd="󰛨 Day light"
monon="󰍺 ON"
monoff="󰶐 OFF"
monen="󰍺 ENABLE"
mondis="󰶐 DISABLE"
gtkportal="Restart Portal"

# Get answer from user via wofi
selected_option=$(echo "$rsn
$rsd
$monen
$mondis
$monon
$gtkportal
$monoff" | fuzzel -d -l 6 -w 20 -p "Menu"\ )

# Do something based on selected option
if [ "$selected_option" == "$rsn" ]; then
	hyprctl dispatch exec "gammastep -l 0:0 -o -b 0.8:0.8 -O 4500"
elif [ "$selected_option" == "$rsd" ]; then
	hyprctl dispatch exec "pkill gammastep"
elif [ "$selected_option" == "$gtkportal" ]; then
	hyprctl dispatch exec "systemctl --user restart xdg-desktop-portal-gtk.service"
elif [ "$selected_option" == "$monon" ]; then
	hyprctl dispatch dpms on HDMI-A-1
	hyprctl dispatch dpms on DP-2
	hyprctl dispatch dpms on DP-3
elif [ "$selected_option" == "$monoff" ]; then
	hyprctl dispatch dpms off HDMI-A-1
	hyprctl dispatch dpms off DP-2
	hyprctl dispatch dpms off DP-3
elif [ "$selected_option" == "$monen" ]; then
	sed -i "s/^monitor = DP-2,disable/#monitor = DP-2,disable/" /home/ptc/.dotfiles/home/dotconfig/hypr/hyprland.conf
	sed -i "s/^monitor = DP-3,disable/#monitor = DP-3,disable/" /home/ptc/.dotfiles/home/dotconfig/hypr/hyprland.conf
	sed -i "s/^monitor = HDMI-A-1,disable/#monitor = HDMI-A-1,disable/" /home/ptc/.dotfiles/home/dotconfig/hypr/hyprland.conf
elif [ "$selected_option" == "$mondis" ]; then
	sed -i "s/^#monitor = DP-2,disable/monitor = DP-2,disable/" /home/ptc/.dotfiles/home/dotconfig/hypr/hyprland.conf
	sed -i "s/^#monitor = DP-3,disable/monitor = DP-3,disable/" /home/ptc/.dotfiles/home/dotconfig/hypr/hyprland.conf
	sed -i "s/^#monitor = HDMI-A-1,disable/monitor = HDMI-A-1,disable/" /home/ptc/.dotfiles/home/dotconfig/hypr/hyprland.conf
else
	echo "No match"
fi
