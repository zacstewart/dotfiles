#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Wait until all polybars quit
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config.ini
# polybar primary 2>&1 | tee -a /tmp/polybar.log & disown

if type "xrandr"; then
  xrandr --query | grep " connected" | while read -r monitor ; do
    output=$(echo $monitor | cut -d" " -f1)
    echo $monitor | grep "primary" > /dev/null
    if [ $? -eq 0 ]; then
      bar="primary"
    else
      bar="secondary"
    fi
    echo $monitor
    echo "Starting $bar"
    MONITOR=$output polybar --reload $bar | tee -a /tmp/polybar.log & disown
  done
else
  polybar --reload primary | tee -a /tmp/polybar.log & disown
fi

echo "Polybar launched..."
