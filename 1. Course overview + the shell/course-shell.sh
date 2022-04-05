#!/usr/bin/env bash

#1
echo "$SHELL"

#2
mkdir /tmp/missing

#3
man touch

#4
touch /tmp/missing/semester

#5
echo '#!/bin/sh' > /tmp/missing/semester
echo 'curl --head --silent https://missing.csail.mit.edu' >> /tmp/missing/semester

#6
/tmp/missing/semester

#7
sh /tmp/missing/semester

#8
man chmod

#9
chmod +x /tmp/missing/semester

#10
/tmp/missing/semester | head -n 4 | tail -n 1 > ~/last-modified.txt

#11
cat /sys/class/power_supply/BAT1/capacity
echo "$(cat /sys/class/thermal/thermal_zone0/temp)" / 1000 | bc
