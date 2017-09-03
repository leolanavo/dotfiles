#!/bin/bash

xrandr | grep -o "^.* connected" | sed "s/ connected//"
