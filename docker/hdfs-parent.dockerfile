FROM reynoldsm88/hadoop-parent:latest

LABEL maintainer="reynoldsm88@gmail.com"

ENV HADOOP_VERSION 2.7.7
ENV HADOOP_HOME /opt/hadoop

USER root

# ssh stuff for passwordless login between masters and workers, don't really care too much about security ATM
RUN groupadd hadoop && useradd -m hadoop -g hadoop -s /bin/bash && \
    cp -r /root/.ssh /home/hadoop/.ssh && \
    chown -R hadoop:hadoop /home/hadoop/.ssh && \
    chmod -R 400 /home/hadoop/.ssh && \
    cat /home/hadoop/.ssh/id_rsa.pub >> /home/hadoop/.ssh/authorized_keys

ADD --chown=hadoop:hadoop ./distro/hadoop-$HADOOP_VERSION.tar.gz /tmp

RUN mv /tmp/hadoop-$HADOOP_VERSION /opt/hadoop && \
    chown -R hadoop:hadoop /opt/hadoop && \
    chmod u+x /opt/hadoop/bin/* && \
    mkdir -p /etc/hadoop/hdfs/tmp && \
    chown -R hadoop:hadoop /etc/hadoop

COPY conf/hdfs/core-site.xml /opt/hadoop/etc/hadoop/core-site.xml
COPY conf/hdfs/hdfs-site.xml /opt/hadoop/etc/hadoop/hdfs-site.xml

CMD  /usr/sbin/sshd -D