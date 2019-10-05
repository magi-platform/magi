#!/bin/bash
/usr/sbin/sshd && 

IS_FORMATTED=$(find $NAME_NODE_DIR -name VERSION)

if [ -z $IS_FORMATTED ]; then
    echo "Formatting a new name node"
    $HADOOP_HOME/bin/hdfs namenode -format -force
else
    echo "Recovering namenode from : $IS_FORMATTED"
fi    

$HADOOP_HOME/bin/hdfs namenode