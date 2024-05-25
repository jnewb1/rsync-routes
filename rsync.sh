#!/bin/bash

set -x

# Ensure only 1 instance is created
pid=/var/run/rsync.sh.pid
trap "rm -f '$pid'" EXIT
echo $$ > "$pid"

echo "Running rsync..."

SSH_ARGS="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
RSYNC_CMD="rsync --size-only --bwlimit=5000 --progress -og --chown=99:100 --chmod=ugo=rwX"

HOSTS="192.168.1.70,192.168.1.142"

for host in $(echo $HOSTS | tr "," "\n")
do
    DONGLE_ID="$(ssh $SSH_ARGS comma@$host 'cat /data/params/d/DongleId')"

    echo "rsyncing from comma@$host with dongle id $DONGLE_ID"
    $RSYNC_CMD -e "ssh $SSH_ARGS" -r comma@$host:/data/media/0/realdata/ /mnt/routes/$DONGLE_ID/
done
