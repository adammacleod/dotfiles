#!/bin/sh

(sleep 3 && mate-power-manager) &
mate-volume-control-applet &
mate-settings-daemon &
nm-applet --sm-disable &

synapse -s &

exec i3
