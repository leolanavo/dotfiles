#!/bin/bash

xset q | grep Caps | cut -d ":" -f 5 | cut -d " " -f 5
