#!/bin/bash
echo "Starting HBase Master Thrift server"
/opt/hbase/bin/hbase thrift start &

echo "Starting HBase Master REST server"
/opt/hbase/bin/hbase rest start &

echo "Starting HBase Master"
/opt/hbase/bin/hbase master start