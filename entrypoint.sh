#!/bin/bash

while true
do
    /opt/run.sh || true # ignore errors...
    echo 'sleeping for ${DELAY:=3600}'
    sleep $DELAY
done