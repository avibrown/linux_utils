#!/bin/bash

#get the desired end time as an argument
end_time=$1

#check if the argument is provided
if [ $# -ne 1 ]; then
    echo "Please provide the desired end time as argument (HH:MM:SS)"
    exit 1
fi

#convert the end time argument to seconds
end_time_seconds=$(date -d "$end_time" +%s)

#calculate the session and break times in seconds
session_time=25*60
break_time=5*60
long_break_time=15*60

#get the current time in seconds
current_time=$(date +%s)

#initialize number of sessions
n=0

#loop until the current time is less than the end time
while [ $current_time -lt $end_time_seconds ]
do
  n=$((n+1))
  current_time=$((current_time+session_time))
  if [ $(($n % 3)) -eq 0 ]; then
    current_time=$((current_time + long_break_time))
  else
    current_time=$((current_time + break_time))
  fi
done

n=$(($n - 1))

#print the number of sessions that can be completed
echo "Number of Pomodoro sessions that can be completed before $end_time: $n"
