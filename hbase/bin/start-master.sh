#!/bin/bash
/usr/sbin/sshd &&

touch /opt/hbase/logs/hbase.log

SCHEMA_IMPORT_PAUSE=${SCHEMA_IMPORT_PAUSE:=60}

echo "Starting HBase Master"
/opt/hbase/bin/hbase master start >> /opt/hbase/logs/hbase.log &

if [ -z "$SCHEMA_PATH" ]; then
    echo "no schema to import"
else
    echo "importing schema instructions from $SCHEMA_PATH"
    sleep $SCHEMA_IMPORT_PAUSE
    /opt/hbase/bin/hbase shell -n $SCHEMA_PATH
fi

tail -f /opt/hbase/logs/hbase.log
