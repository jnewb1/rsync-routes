#!/bin/bash

# Ensure only 1 instance is created
pid=/var/run/run.sh.pid
trap "rm -f '$pid'" EXIT
echo $$ > "$pid"

echo "running rsync on $RSYNC_HOSTS"

for rsync_host in $(echo $RSYNC_HOSTS | tr "," "\n")
do
    /opt/rsync.sh $rsync_host
done
