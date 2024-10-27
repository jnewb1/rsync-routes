#!/bin/bash

echo "starting rsync for $RSYNC_HOSTS"

for rsync_host in $(echo $RSYNC_HOSTS | tr "," "\n")
do
    /opt/rsync.sh $rsync_host
done
