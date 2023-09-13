#!/bin/sh

# Options for menu
rsn="󱩍 Night light"
rsd="󰛨 Day light"
dp2on="󰍺 DP-2 On"
dp2off="󰶐 DP-2 Off"

# Get answer from user via wofi
selected_option=$(echo "$rsn
$rsd
$dp2off
$dp2on" | fuzzel -d -l 4 -w 20 -p "Menu"\ )

# Do something based on selected option
if [ "$selected_option" == "$rsn" ]; then
	hyprctl dispatch exec "gammastep -l 0:0 -o -b 0.8:0.8 -O 4500"
elif [ "$selected_option" == "$rsd" ]; then
	hyprctl dispatch exec "pkill gammastep"
elif [ "$selected_option" == "$dp2on" ]; then
	hyprctl dispatch dpms on DP-2
elif [ "$selected_option" == "$dp2off" ]; then
	hyprctl dispatch dpms off DP-2
else
	echo "No match"
fi
