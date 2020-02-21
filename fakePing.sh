#!/bin/bash

i=0

trap 'printout $1 i' SIGINT
printout() {
   echo 
   echo "--- $1 ping statistic ---"
   echo "$i packets transmitted, $i packets received, 0.0% packet loss"
   echo "round-trip min/avg/max/stddev = 0.$((1 + RANDOM % 150))/0.$((1 + RANDOM % 150))/0.$((1 + RANDOM % 150))/0.$((1 + RANDOM % 150)) ms"
   exit
}

echo "PING $1 ($1): 56 data bytes"
while true
do
	echo "64 bytes from $1: icmp_seq=0 ttl=64 time=0.$((1 + RANDOM % 150))"
   i=$((i+1))
	sleep 1
done
