#################
#
# HDFS Namenode
#
#################
FROM reynoldsm88/hadoop-parent:latest

LABEL maintainer="reynoldsm88@gmail.com"

ENV NAME_NODE_DIR $HDFS_DATA_ROOT/namenode

RUN mkdir -p /etc/hadoop/hdfs/namenode

# HDFS client, http, and https ports
EXPOSE 9000 50070 50470 

CMD $HADOOP_HOME/bin/hdfs namenode -format -force && $HADOOP_HOME/bin/hdfs namenode
