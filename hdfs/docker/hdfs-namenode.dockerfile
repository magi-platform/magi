FROM magiplatform/hdfs-parent:latest

LABEL maintainer="reynoldsm88@gmail.com"

ENV NAME_NODE_DIR /opt/app/data/namenode
RUN mkdir -p $NAME_NODE_DIR
VOLUME $NAME_NODE_DIR

# HDFS client, http, and https ports
EXPOSE 9000 50070 50470 22

ENTRYPOINT /opt/hadoop/bin/start-namenode.sh
