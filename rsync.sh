#!/bin/sh

# Ensure only 1 instance is created
pid=/var/run/rsync.sh.pid
trap "rm -f -- '$pid'" EXIT
echo $$ > "$pid"

echo "Running rsync..."

ssh-keyscan "10.0.90.37" >> ~/.ssh/known_hosts
ssh-keyscan "ssh.comma.ai" >> ~/.ssh/known_hosts

RSYNC_CMD="rsync --bwlimit=5000 --progress -og --chown=99:100 --chmod=ugo=rwX"

$RSYNC_CMD -r comma@10.0.90.37:/data/media/0/realdata /mnt/routes
$RSYNC_CMD -r comma-d9df6f87e8feff94:/data/media/0/realdata /mnt/routes