#!/bin/sh
set -e

echo -e "nameserver 223.5.5.5\nnameserver 223.6.6.6\nnameserver 8.8.8.8" > /etc/resolv.conf

while true; do
    if ps -ef | grep vod_httpserver|grep -v grep > /dev/null; then
        sleep 60
    else
        ./bin/portal
    fi
done

