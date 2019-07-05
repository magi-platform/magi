FROM reynoldsm88/centos-jdk:latest

LABEL maintainer="reynoldsm88@gmail.com"

USER root

# ssh stuff for passwordless login between masters and workers, don't really care too much about security ATM
# 
# !!! NOTE !!! - Since this environment is currently only to support an easy
# development environment, no consideration is put into the security of the SSL certs.
#
# For ease of use, all platform components use the same SSH keys
#
ADD conf/ssh /root/.ssh

RUN yum install -y openssh-server && \
    yum install -y openssh && \
    yum install -y openssh-clients && \
    mkdir -p /etc/ssh && \
    cp ~/.ssh/id_rsa /etc/ssh/ssh_host_rsa_key && \
    cp ~/.ssh/id_ecdsa /etc/ssh/ssh_host_ecdsa_key && \
    cp ~/.ssh/id_ed25519 /etc/ssh/ssh_host_ed25519_key && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    chown -R root:root /etc/ssh/*

CMD /usr/sbin/sshd -D