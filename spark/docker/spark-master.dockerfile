FROM magiplatform/spark-parent:3.1.2

LABEL maintainer="reynoldsm88@gmail.com"

EXPOSE 7077 8080 6060

ENTRYPOINT /opt/spark/sbin/start-master.sh