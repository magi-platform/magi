FROM reynoldsm88/hadoop-parent:latest
LABEL maintainer="michael.reynolds@twosixlabs.com"

ENV HBASE_VERSION 2.1.5
ENV HBASE_HOME /opt/hbase

USER root

RUN groupadd hbase && useradd -m hbase -g hbase -s /bin/bash && \
    cp -r /root/.ssh /home/hbase/.ssh && \
    chown -R hbase:hbase /home/hbase/.ssh && \
    chmod -R 400 /home/hbase/.ssh && \
    cat /home/hbase/.ssh/id_rsa.pub >> /home/hbase/.ssh/authorized_keys

ADD --chown=hbase:hbase ./distro/hbase-$HBASE_VERSION-bin.tar.gz /tmp

RUN mv /tmp/hbase-$HBASE_VERSION /opt/hbase && \
    chown -R hbase:hbase $HBASE_HOME && \
    chown -R hbase:hbase /opt/app && \
    chmod -R 744 $HBASE_HOME && \
    chmod -R 744 /opt/app

ENTRYPOINT /bin/bash