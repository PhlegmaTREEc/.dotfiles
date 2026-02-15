#!/bin/sh

wpctl set-volume $(pw-cli i alsa_input.usb-BLUE_MICROPHONE_Blue_Snowball_201509-00.analog-stereo | grep -oP 'id: \K\w+') 0.8
wpctl set-volume $(pw-cli i alsa_input.usb-ARTURIA_ArturiaMsd-00.analog-stereo | grep -oP 'id: \K\w+') 1.5
wpctl set-mute $(pw-cli i alsa_input.usb-BLUE_MICROPHONE_Blue_Snowball_201509-00.analog-stereo | grep -oP 'id: \K\w+') toggle
wpctl set-mute $(pw-cli i alsa_input.usb-ARTURIA_ArturiaMsd-00.analog-stereo | grep -oP 'id: \K\w+') toggle
pw-link "alsa_input.usb-ARTURIA_ArturiaMsd-00.analog-stereo:capture_FL" "ee_sie_rnnoise:input_FL"
pw-link "alsa_input.usb-ARTURIA_ArturiaMsd-00.analog-stereo:capture_FL" "ee_sie_rnnoise:input_FR"
pw-link --disconnect "alsa_input.usb-ARTURIA_ArturiaMsd-00.analog-stereo:capture_FR" "ee_sie_rnnoise:input_FR"
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 0.8
