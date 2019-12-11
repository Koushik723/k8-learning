#!/bin/bash

RAWIN=$(ps -o pid,user,%mem,cmd ax | grep -v PID | sort -bnr -k3 | awk '/[0-9]*/{print $1 ":" $2 ":" $4}')

for i in $RAWIN:
do
   PID = $(echo $i | cut -d: f1)
   OWNER=$(echo $i | cut -d: f2)
   COMMAND=$(echo $i | cut -d: f4)
   Memory=$(pmap $PID | tail -n 1 | awk '/[0-9]K/{print $2}')

   echo "PID : $PID"
   echo "Owner : $OWNER"
   echo "Command : $COMMAND"
   echo ""

done
