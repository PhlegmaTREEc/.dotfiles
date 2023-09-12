#!/usr/bin/bash

# Try to rewrite this to use as replacemnt for rofi -show window
# wmctrl -l	will list all windows
# wmcrtl -ai	will swith to window based in window id

# Options for powermenu

# Get answer from user via rofi
selapp=$(wmctrl -l | cut -d " " -f 5- | rofi -dmenu\
	-i\
	-p "Switcher"\
	-config "~/.config/rofi/smallmenu.rasi"\
	-l 10\ )


#selid="$selapp | awk '{print $1}'"
# Do something based on selected option
if [ -z "$selapp" ]
then
    echo "No match"
#elif [ "$selected_option" == "$rsd" ]
#then
#    redshift -x
else
    wmctrl -a $selapp
fi
