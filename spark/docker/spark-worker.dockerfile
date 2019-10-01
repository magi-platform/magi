FROM reynoldsm88/spark-parent:latest

EXPOSE 7078 8081

ENTRYPOINT /opt/spark/sbin/start-slave.sh spark://$SPARK_MASTER_HOST:7077