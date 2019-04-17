FROM reynoldsm88/centos-jdk8:latest

LABEL maintainer="reynoldsm88@gmail.com"

ENV HADOOP_VERSION 2.7.7

USER root

RUN groupadd hadoop && useradd -m hadoop -g hadoop -s /bin/bash

ADD --chown=hadoop:hadoop ./distro/hadoop-$HADOOP_VERSION.tar.gz /tmp

RUN mv /tmp/hadoop-$HADOOP_VERSION /opt/hadoop && \
	chown -R hadoop:hadoop /opt/hadoop && \
	chmod u+x /opt/hadoop/bin/* && \
	which java

USER hadoop

CMD /opt/hadoop/bin/hdfs version