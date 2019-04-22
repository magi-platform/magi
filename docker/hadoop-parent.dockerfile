FROM reynoldsm88/centos-jdk8:latest

LABEL maintainer="reynoldsm88@gmail.com"

ENV HADOOP_VERSION 2.7.7
ENV HADOOP_HOME /opt/hadoop

USER root

RUN groupadd hadoop && useradd -m hadoop -g hadoop -s /bin/bash

ADD --chown=hadoop:hadoop ./distro/hadoop-$HADOOP_VERSION.tar.gz /tmp

RUN mv /tmp/hadoop-$HADOOP_VERSION /opt/hadoop && \
	chown -R hadoop:hadoop /opt/hadoop && \
	chmod u+x /opt/hadoop/bin/* && \
	mkdir -p /etc/hadoop/hdfs/tmp && \
	chown -R hadoop:hadoop /etc/hadoop

COPY conf/hdfs/core-site.xml /opt/hadoop/etc/hadoop/core-site.xml
COPY conf/hdfs/hdfs-site.xml /opt/hadoop/etc/hadoop/hdfs-site.xml

USER hadoop

CMD /opt/hadoop/bin/hdfs version
