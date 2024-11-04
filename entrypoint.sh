#!/bin/bash

while true
do
    /opt/run.sh || true # ignore errors...
    DELAY_DEFAULT="${DELAY:=3600}"
    echo "sleeping for $DELAY_DEFAULT"
    sleep $DELAY_DEFAULT
done
