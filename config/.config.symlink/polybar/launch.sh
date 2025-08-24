#!/usr/bin/env bash

killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 0.2; done

# How many outputs are actually connected?
mon_count=$(xrandr --query | grep -c ' connected')

# Helper: is this the built-in panel?
is_laptop_panel() { [[ $1 =~ ^eDP(-[0-9])?$ ]]; }

xrandr --query | grep ' connected' | while read -r line; do
    output=$(echo "$line" | awk '{print $1}')

    if [[ $mon_count -eq 1 ]]; then
        bar="sole"
    elif is_laptop_panel "$output"; then
        bar="secondary"
    else
        bar="primary"
    fi

    echo "Starting bar '$bar' on $output" | systemd-cat -t polybar
    systemd-cat -t polybar \
      env MONITOR=$output polybar --reload "$bar" \
      & disown

done

echo "Polybar launched..." | systemd-cat -t polybar
