#!/bin/bash

#get the number of sessions as an argument
x=$1

#check if the argument is provided
if [ $# -ne 1 ]; then
    echo "Please provide number of sessions as argument"
    exit 1
fi

#calculate time after completing x number of Pomodoro sessions
current_time=$(date +%s)
session_time=25*60
break_time=5*60
session_and_break_time=$((session_time + break_time))
long_break_time=15*60

#loop through the number of sessions
for ((i=1; i<x; i++))
do
  if [ $(($i % 3)) -eq 0 ]; then
    current_time=$((current_time + session_time + long_break_time))
  else
    current_time=$((current_time + session_time + break_time))
  fi
done

# add the last session time
current_time=$((current_time + session_time))

#print the final time
echo "Time after completing $x Pomodoro sessions: $(date -d @$current_time +"%T")"
