#!/bin/sh

echo "Running rsync..."

ssh-keyscan ssh.comma.ai >> ~/.ssh/known_hosts

rsync --progress -og --chown=99:100 --chmod=ugo=rwX -r comma@10.0.0.37:/data/media/0/realdata/* /mnt/routes
rsync --progress -og --chown=99:100 --chmod=ugo=rwX -r comma-d9df6f87e8feff94:/data/media/0/realdata/* /mnt/routes