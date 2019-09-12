#!/bin/bash
echo "Starting HBase ReionServer Thrift server"
/opt/hbase/bin/hbase thrift start &

echo "Starting HBase RegionServer REST server"
/opt/hbase/bin/hbase rest start &

echo "Starting HBase RegionServer"
/opt/hbase/bin/hbase regionserver start