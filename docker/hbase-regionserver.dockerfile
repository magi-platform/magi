FROM reynoldsm88/hbase-parent:latest
LABEL maintainer="michael.reynolds@twosixlabs.com"

EXPOSE 60020 60030 8080 8085 9090 9095

COPY ./scripts/hbase/start-regionserver.sh /opt/hbase/bin/start-regionserver.sh
RUN ls -al /opt/hbase/bin

CMD /usr/sbin/sshd
ENTRYPOINT /opt/hbase/bin/start-regionserver.sh