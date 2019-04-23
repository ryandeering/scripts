#!/bin/bash

alias beep="aplay ~/usr/bin/ding.wav"

#This is for playing a beep after a batch job. The wav is in the repo for usage. && beep for usage.


acpi -t

#quick thermal

sudo du -a / | sort -n -r | head -n 20 && beep
#biggest directories in file system

sudo strace -p 1205 
#See syscalls of PID 1205. Processes don't have to be a black box, you can use strace (on Linux) to view the system calls made by a process
#which may give some clue as to why it's misbehaving, where it is saving a file, etc. here it is saving a file, etc.
