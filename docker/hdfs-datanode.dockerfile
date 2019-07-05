FROM reynoldsm88/hdfs-parent:latest

LABEL maintainer="reynoldsm88@gmail.com"

ENV DATA_NODE_DIR /opt/app/data/datanode

RUN mkdir -p $DATA_NODE_DIR

# web ui, https, data transfer, metadata ops
EXPOSE 50075 50475 50010 50020

CMD /usr/sbin/sshd
ENTRYPOINT /usr/sbin/sshd && $HADOOP_HOME/bin/hdfs datanode