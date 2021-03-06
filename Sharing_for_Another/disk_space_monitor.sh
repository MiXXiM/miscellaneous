#!/bin/bash

# Set percentage
warning_level=70
# Set minutes
check_interval=3

while true; do
  # Percentage of disk space used
  used_space=$(df -HP / \
    | tail -1 \
    | tr -s ' ' \
    | cut -d' ' -f5 | cut -d'%' -f1)
    
  if [ $used_space -ge $warning_level ]
  then
    notify-send "System drive is ${used_space}% full               " \
      -i dialog-warning -t 36000000 -u critical
    exit
  fi
  
  sleep ${check_interval}m
done
