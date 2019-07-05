FROM reynoldsm88/hdfs-parent:latest

LABEL maintainer="reynoldsm88@gmail.com"

ENV DATA_NODE_DIR /etc/hadoop/hdfs/datanode

RUN mkdir -p $DATA_NODE_DIR

# web ui, https, data transfer, metadata ops
EXPOSE 50075 50475 50010 50020

CMD $HADOOP_HOME/bin/hdfs datanode