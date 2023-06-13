#!/bin/sh

ssh-keyscan comma-d9df6f87e8feff94 >> ~/.ssh/known_hosts

rsync -og --chown=99:100 --chmod=ugo=rwX -r comma@10.0.0.37:/data/media/0/realdata/* /mnt/routes
rsync -og --chown=99:100 --chmod=ugo=rwX -r comma-d9df6f87e8feff94:/data/media/0/realdata/* /mnt/routes