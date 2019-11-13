#!/bin/bash
/usr/sbin/sshd &&

touch /opt/hbase/logs/hbase.log

echo "Starting HBase Master"
/opt/hbase/bin/hbase master start >> /opt/hbase/logs/hbase.log &

if [ -z "$SCHEMA_PATH" ]; then
    echo "no schema to import"
else
    echo "importing schema instructions from $SCHEMA_PATH"
    sleep 30
    /opt/hbase/bin/hbase shell -n $SCHEMA_PATH
fi

tail -f /opt/hbase/logs/hbase.log
