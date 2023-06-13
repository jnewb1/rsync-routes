#!/bin/sh

echo "Running rsync..."

ssh-keyscan ssh.comma.ai >> ~/.ssh/known_hosts

RSYNC_CMD=rsync --progress -og --chown=99:100 --chmod=ugo=rwX

$RSYNC_CMD -r comma@10.0.0.37:/data/media/0/realdata/* /mnt/routes
$RSYNC_CMD -r comma-d9df6f87e8feff94:/data/media/0/realdata/* /mnt/routes