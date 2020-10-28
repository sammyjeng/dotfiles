#!/usr/bin/bash

sudo ifconfig wlp3s0 down

sudo macchanger -A wlp3s0

sudo ifconfig wlp3s0 up

