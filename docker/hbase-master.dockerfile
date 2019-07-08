FROM reynoldsm88/hbase-parent:latest
LABEL maintainer="michael.reynolds@twosixlabs.com"

EXPOSE 60000 60010 60020 60030 2888

COPY ./scripts/hbase/start-master.sh /opt/hbase/bin/start-master.sh
RUN ls -al /opt/hbase/bin

CMD /usr/sbin/sshd
ENTRYPOINT /opt/hbase/bin/start-master.sh