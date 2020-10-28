#!/usr/bin/env bash

LOC=$1
trap 'rm -f "$TMPFILE"' EXIT
TMPFILE=$(mktemp) || exit 1
if [[ -z "$LOC" ]]; then 
    curl -s v2.wttr.in > $TMPFILE
    paste $TMPFILE | grep  weather | cut -f 6-7 -d " " | toilet --gay -f future
    paste $TMPFILE | tail -5 | head -4 | lolcat
elif [[ $LOC == "moon" ]]; then
    curl -s wttr.in/moon
else
    curl -s v2.wttr.in/$LOC > $TMPFILE
    paste $TMPFILE | grep  weather | cut -f 6-7 -d " " | toilet --gay -f future
    paste $TMPFILE | tail -6 | head -5 | lolcat
fi
