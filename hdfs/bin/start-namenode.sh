#!/bin/bash
/usr/sbin/sshd && 

IS_FORMATTED=$(find $HADOOP_NAMENODE_DIR -name VERSION)

echo "found existing hdfs directory : $IS_FORMATTED"

if [ -z $IS_FORMATTED ]; then
    echo "Formatting a new name node"
    $HADOOP_HOME/bin/hdfs namenode -format -force
else
    echo "Recovering namenode"
fi    

$HADOOP_HOME/bin/hdfs namenode