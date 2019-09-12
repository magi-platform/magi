FROM reynoldsm88/hadoop-parent:latest

LABEL maintainer="reynoldsm88@gmail.com"

ENV HADOOP_VERSION 2.7.7
ENV HADOOP_HOME /opt/hadoop

USER root

ADD ./distro/hadoop-$HADOOP_VERSION.tar.gz /tmp

RUN mv /tmp/hadoop-$HADOOP_VERSION $HADOOP_HOME && \
    chmod u+x $HADOOP_HOME/bin/*

COPY hdfs/conf/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
COPY hdfs/conf/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml