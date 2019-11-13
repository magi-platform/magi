#!/bin/bash
/usr/sbin/sshd &&

echo "Starting HBase RegionServer REST server"
/opt/hbase/bin/hbase rest start &

echo "Starting HBase RegionServer"
/opt/hbase/bin/hbase regionserver start