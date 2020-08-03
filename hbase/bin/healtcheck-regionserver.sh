#!/bin/bash

PORT_UP=$(netstat -an | grep 60020 | grep LISTEN)

if [ -z "$PORT_UP" ]; then
    echo 'hbase regionserver is not running'
    exit 1
else
    echo "hbase regionserver is up"
    exit 0
fi