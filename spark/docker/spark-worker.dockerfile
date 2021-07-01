FROM magiplatform/spark-parent:3.1.2

EXPOSE 7078 8081

ENTRYPOINT /opt/spark/sbin/start-slave.sh spark://$SPARK_MASTER_HOST:7077