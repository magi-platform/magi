FROM reynoldsm88/hadoop-parent:latest

LABEL maintainer="reynoldsm88@gmail.com"

ENV NAME_NODE_DIR /etc/hadoop/hdfs/namenode

RUN mkdir -p $NAME_NODE_DIR

# HDFS client, http, and https ports
EXPOSE 9000 50070 50470 

CMD $HADOOP_HOME/bin/hdfs namenode -format -force && $HADOOP_HOME/bin/hdfs namenode