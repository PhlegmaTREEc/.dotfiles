#!/bin/sh

set -e

snore() {
    local IFS
    [[ -n "${_snore_fd:-}" ]] || exec {_snore_fd}<> <(:)
    read -r ${1:+-t "$1"} -u $_snore_fd || :
}

DELAY=0.2

while snore $DELAY; do
    WP_OUTPUT=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
    ICON=󰕾

    if [[ $WP_OUTPUT =~ ^Volume:[[:blank:]]([0-9]+)\.([0-9]{2})([[:blank:]].MUTED.)?$ ]]; then
        if [[ -n ${BASH_REMATCH[3]} ]]; then
            printf "$ICON M\n"
        else
            VOLUME=$((10#${BASH_REMATCH[1]}${BASH_REMATCH[2]}))

            printf "$ICON $VOLUME%%\n"
        fi
    fi
done

exit 0
