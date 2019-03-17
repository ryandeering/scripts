#!/bin/bash

alias beep="aplay ~/usr/bin/ding.wav"

#This is for playing a beep after a batch job. The wav is in the repo for usage. && beep for usage.


acpi -t

#quick thermal

sudo du -a / | sort -n -r | head -n 20 && beep
#biggest directories in file system