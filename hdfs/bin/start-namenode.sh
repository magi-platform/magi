#!/bin/bash
/usr/sbin/sshd && 

IS_FORMATTED=$(find $HADOOP_NAMENODE_DIR -name VERSION)

if [ -z $IS_FORMATTED ]; then
    echo "This is the first time this node is starting. Formatting namenode now"
    $HADOOP_HOME/bin/hdfs namenode -format -force
else
    echo "Recovering namenode"
fi    

$HADOOP_HOME/bin/hdfs namenode