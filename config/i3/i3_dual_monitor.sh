#!/bin/sh

INTERAL_OUTPUT="eDP1"
EXTERNAL_OUTPUT="HDMI1"

if [ ! -f "/tmp/monitor_mode.dat" ] ; then
  MONITOR_MODE="mirror"
else
  MONITOR_MODE=`cat /tmp/monitor_mode.dat`
fi

if [ $MONITOR_MODE == "mirror" ]; then
    MONITOR_MODE="dual"
    xrandr --output $INTERAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --left-of $INTERAL_OUTPUT
else
    MONITOR_MODE="mirror"
    xrandr --output $INTERAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERAL_OUTPUT
fi

echo "${MONITOR_MODE}" > /tmp/monitor_mode.dat
