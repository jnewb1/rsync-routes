#!/bin/bash

while true
do
    /opt/run.sh || true # ignore errors...
    echo 'sleeping for $DELAY'
    sleep $DELAY
done