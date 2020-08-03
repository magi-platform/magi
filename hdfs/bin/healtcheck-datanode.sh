#!/bin/bash

PORT_UP=$(netstat -an | grep 50020 | grep LISTEN)

if [ -z "$PORT_UP" ]; then
    echo 'hdfs datanode is not running'
    exit 1
else
    echo "hdfs datanode is up"
    exit 0
fi
