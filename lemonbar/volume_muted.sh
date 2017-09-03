#!/bin/bash
pactl list sinks | sed -r -n 's/(.*Mute:\ )((no)|(yes))/\2/p'
#                              s/\(.*Mute:\ \)\(\(yes\)\|\(no\)\)/\\2\p
