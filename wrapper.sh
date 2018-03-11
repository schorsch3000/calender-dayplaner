#!/bin/bash
set -x

if [ -z "$STEP" ]; then
    STEP=1
fi


if [ -z "$uid" ]; then
    uid=1000
fi


if [ -z "$gid" ]; then
    gid=1000
fi


if [ "$STEP" -eq "1" ] ; then
    groupmod -g $gid libreoffice
    usermod -u $uid -g $gid libreoffice
    mkdir -p /home/libreoffice/.local/share
    chown -R libreoffice:libreoffice /home/libreoffice/
    export STEP=2
    su  -c "$0 $1 $2 $3" libreoffice
    exit
fi


if [ "$STEP" -eq "2" ] ; then
    cd ~/app
    ls -lsah
    ./genPlanner "$@"
fi

