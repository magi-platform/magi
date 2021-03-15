FROM magiplatform/hadoop-parent:latest

ENV SPARK_VERSION 2.4.7
ENV HADOOP_VERSION 2.7
ENV SPARK_MASTER_HOST "spark-master"
ENV SPARK_HOME /opt/spark

ADD ./distro/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz /tmp

RUN mv /tmp/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /tmp/spark

COPY ./spark/conf/* /tmp/spark/conf/
COPY ./spark/hdfs-conf /tmp/spark

RUN mv /tmp/spark /opt && \
    chmod -R u+x /opt/spark/sbin

ENV PATH "$PATH:/opt/spark/bin"
