#!/bin/sh

# Ensure only 1 instance is created
pid=/var/run/rsync.sh.pid
trap "rm -f '$pid'" EXIT
echo $$ > "$pid"

echo "Running rsync..."

RSYNC_CMD="rsync --size-only --bwlimit=5000 --progress -og --chown=99:100 --chmod=ugo=rwX"

HOSTS="192.168.1.70,192.168.1.142"

IFS=","
for host in $HOSTS
do
    rm ~/.ssh/known_hosts
    ssh-keyscan -H "$host" >> ~/.ssh/known_hosts
    DONGLE_ID="$(ssh comma@$host 'cat /data/params/d/DongleId')"

    echo "rsyncing from comma@$host with dongle id $DONGLE_ID"
    $RSYNC_CMD -r comma@$host:/data/media/0/realdata/ /mnt/routes/d9df6f87e8feff94/
done
