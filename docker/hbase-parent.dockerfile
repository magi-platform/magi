FROM reynoldsm88/hadoop-parent:latest
LABEL maintainer="michael.reynolds@twosixlabs.com"

ENV HBASE_VERSION 2.1.5
ENV HBASE_HOME /opt/hbase

ADD ./distro/hbase-$HBASE_VERSION-bin.tar.gz /tmp

RUN mv /tmp/hbase-$HBASE_VERSION /opt/hbase && \
    chmod -R 755 /opt/hbase