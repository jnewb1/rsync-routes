#!/bin/bash

while true
do
    /opt/run.sh || true # ignore errors...
    delay = "${DELAY:=3600}"
    echo 'sleeping for $delay'
    sleep $delay
done
