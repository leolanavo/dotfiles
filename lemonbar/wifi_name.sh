#!/bin/bash

nmcli | grep wlp2s0: | cut -d " " -f 4
