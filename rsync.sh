#!/bin/sh

if [[ `pgrep -f $0` != "$$" ]]; then
    echo "Already running, skipping..."
    exit
fi

echo "Running rsync..."

ssh-keyscan ssh.comma.ai >> ~/.ssh/known_hosts

RSYNC_CMD="rsync --bwlimit=5000 --progress -og --chown=99:100 --chmod=ugo=rwX"

$RSYNC_CMD -r comma@10.0.90.37:/data/media/0/realdata /mnt/routes
$RSYNC_CMD -r comma-d9df6f87e8feff94:/data/media/0/realdata /mnt/routes