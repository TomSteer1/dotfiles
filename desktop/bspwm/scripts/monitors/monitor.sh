#!/usr/bin/env bash

INTERNAL_MONITOR="eDP-1"
EXTERNAL_MONITOR=$1

# If external montior not set as argument, use HDMI-1 as default
if [ -z "$EXTERNAL_MONITOR" ]; then
		EXTERNAL_MONITOR="HDMI-1"
fi

monitor_add() {
  # Move first 5 desktops to external monitor
  for desktop in $(bspc query -D --names -m "$INTERNAL_MONITOR" | tail -n 5); do
    bspc desktop "$desktop" --to-monitor "$EXTERNAL_MONITOR"
  done
  # Remove default desktop created by bspwm
  bspc desktop Desktop --remove
  # reorder monitors
  bspc wm -O "$INTERNAL_MONITOR" "$EXTERNAL_MONITOR"
}

monitor_remove() {
  # Add default temp desktop because a minimum of one desktop is required per monitor
  bspc monitor "$EXTERNAL_MONITOR" -a Desktop

  # Move all desktops except the last default desktop to internal monitor
  for desktop in $(bspc query -D -m "$EXTERNAL_MONITOR");	do
		bspc desktop "$desktop" --to-monitor "$INTERNAL_MONITOR"
	done

	# Delete external monitor
	bspc monitor "$EXTERNAL_MONITOR" --remove
  # reorder desktops
  bspc monitor "$INTERNAL_MONITOR" -d 1 2 3 4 5 6 7 8 9 ♫
}

if [[ $(xrandr -q | grep "${EXTERNAL_MONITOR} connected") ]]; then
  # set xrandr rules for docked setup
	echo "monitor connected"
#  xrandr --output "$INTERNAL_MONITOR" --primary --mode 1920x1080 --pos 0x0 --rotate normal --output "$EXTERNAL_MONITOR" --mode 1920x1080 --pos 1920x0 --rotate normal
  if [[ $(bspc query -D -m "${EXTERNAL_MONITOR}" | wc -l) -ne 5 ]]; then
    monitor_add
  fi
  bspc wm -O "$INTERNAL_MONITOR" "$EXTERNAL_MONITOR"
else
  # set xrandr rules for mobile setup
#  xrandr --output "$INTERNAL_MONITOR" --primary --mode 1920x1080 --pos 0x0 --rotate normal --output "$EXTERNAL_MONITOR" --off
  if [[ $(bspc query -D -m "${INTERNAL_MONITOR}" | wc -l) -ne 10 ]]; then
    monitor_remove
  fi
fi

# Kill and relaunch polybar
killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 2; done
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload $(cat /etc/hostname) &
		sleep 0.5
  done
else
	polybar --reload $(cat /etc/hostname) &
fi

