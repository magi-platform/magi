#!/bin/bash

PORT_UP=$(netstat -an | grep 9000 | grep LISTEN)

if [ -z "$PORT_UP" ]; then
    echo 'hdfs namenode is not running'
    exit 1
else
    echo "hbase namenode is up"
    exit 0
fi
