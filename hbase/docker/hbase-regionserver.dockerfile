FROM reynoldsm88/hbase-parent:latest
LABEL maintainer="michael.reynolds@twosixlabs.com"

EXPOSE 60020 60030 8080 8085 9090 9095 22

COPY ./hbase/bin/start-regionserver.sh /opt/hbase/bin/start-regionserver.sh

ENTRYPOINT /opt/hbase/bin/start-regionserver.sh