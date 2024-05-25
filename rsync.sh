#!/bin/bash

set -xe

echo "Running rsync..."

BWLIMIT="200000"

SSH_ARGS="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
RSYNC_CMD="rsync --timeout=60 --contimeout=5 --size-only --bwlimit=$BWLIMIT --progress -og --chown=99:100 --chmod=ugo=rwX"

host=$1

DONGLE_ID="$(ssh $SSH_ARGS comma@$host 'cat /data/params/d/DongleId')"

echo "rsyncing from comma@$host with dongle id $DONGLE_ID"
$RSYNC_CMD -e "ssh $SSH_ARGS" -r comma@$host:/data/media/0/realdata/ /mnt/routes/$DONGLE_ID/