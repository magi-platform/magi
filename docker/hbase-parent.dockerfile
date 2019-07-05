FROM reynoldsm88/hadoop-parent:latest
LABEL maintainer="michael.reynolds@twosixlabs.com"

ENV HBASE_VERSION 2.1.5
ENV HBASE_HOME /opt/hbase

USER root
