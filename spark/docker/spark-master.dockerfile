FROM magiplatform/spark-parent:2.4.7

LABEL maintainer="reynoldsm88@gmail.com"

EXPOSE 7077 8080 6060

ENTRYPOINT /opt/spark/sbin/start-master.sh