#!/usr/bin/bash
tmux -u a ; [[ $? = 1 ]] && tmux -u new -s $(date +%a-%H)
