#!/usr/bin/bash
ps aux | grep $1 | grep -v "grep" | awk -F " " '{print $2}' | xargs -n1 kill
