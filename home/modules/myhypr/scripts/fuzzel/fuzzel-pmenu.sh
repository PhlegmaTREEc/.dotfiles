#!/bin/sh

# Options for powermenu
# lock="    Lock"
shutdown=" Shutdown"
reboot="󱄌 Reboot"
logout="󰠚 Logout"
# sleep="    Sleep"

# Get answer from user via rofi
selected_option=$(echo "$reboot
$shutdown
$logout" | fuzzel -d -l 3 -w 20 -p "Power"\ )

# Do something based on selected option
# if [ "$selected_option" == "$lock" ]
# then
#     /home/$USER/.config/scripts/i3lock-fancy/i3lock-fancy.sh
# elif [ "$selected_option" == "$logout" ]
# then
#     loginctl terminate-user `whoami`
if [ "$selected_option" == "$shutdown" ]; then
	shutdown now
elif [ "$selected_option" == "$reboot" ]; then
	reboot
elif [ "$selected_option" == "$logout" ]; then
	hyprctl dispatch exit
else
	echo "No match"
fi
