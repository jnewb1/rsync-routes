#!/bin/bash

# Ensure only 1 instance is created
pid=/var/run/run.sh.pid
trap "rm -f '$pid'" EXIT
echo $$ > "$pid"

for host in $(echo $HOSTS | tr "," "\n")
do
    /opt/rsync.sh $host
done
