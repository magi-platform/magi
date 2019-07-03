FROM reynoldsm88/centos-jdk8:latest

LABEL maintainer="reynoldsm88@gmail.com"

ENV HADOOP_VERSION 2.7.7
ENV HADOOP_HOME /opt/hadoop

USER root

# ssh stuff for passwordless login between masters and workers, don't really care too much about security ATM
RUN yum install -y openssh-server && \
    yum install -y openssh && \
    yum install -y openssh-clients

ADD conf/ssh /root/.ssh

# ssh stuff for passwordless login between masters and workers, don't really care too much about security ATM
RUN groupadd hadoop && useradd -m hadoop -g hadoop -s /bin/bash && \
    mkdir -p /etc/ssh && \
    cp ~/.ssh/id_rsa /etc/ssh/ssh_host_rsa_key && \
    cp ~/.ssh/id_ecdsa /etc/ssh/ssh_host_ecdsa_key && \
    cp ~/.ssh/id_ed25519 /etc/ssh/ssh_host_ed25519_key && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    chown -R root:root /etc/ssh/* && \
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