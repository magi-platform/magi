FROM reynoldsm88/hbase-parent:latest
LABEL maintainer="michael.reynolds@twosixlabs.com"

ENV SCHEMA_PATH ""

EXPOSE 60000 60010 2888 8080 8085 9090 9095 22

COPY ./scripts/hbase/start-master.sh /opt/hbase/bin/start-master.sh

ENTRYPOINT /usr/sbin/sshd && /opt/hbase/bin/start-master.sh