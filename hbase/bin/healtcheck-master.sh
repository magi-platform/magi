#!/bin/bash

PORT_UP=$(netstat -an | grep 16000 | grep LISTEN)

if [ -z "$PORT_UP" ]; then
    echo 'hbase master is not running'
    exit 1
else
    echo "hbase master is up"
    exit 0
fi