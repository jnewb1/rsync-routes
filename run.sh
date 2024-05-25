#!/bin/bash

# Ensure only 1 instance is created
pid=/var/run/run.sh.pid
trap "rm -f '$pid'" EXIT
echo $$ > "$pid"

HOSTS="192.168.1.70,192.168.1.142"

for host in $(echo $HOSTS | tr "," "\n")
do
    /opt/rsync.sh $host
done
