IMAGE_PREFIX = reynoldsm88/
IMAGE_NAME = magi
IMG := $(IMAGE_PREFIX)$(IMAGE_NAME)

build-parent:
	./build-tools --hadoop
	docker build -f hadoop/docker/hadoop-parent.dockerfile -t reynoldsm88/hadoop-parent:latest .

build-hdfs: build-parent
	docker build -f hdfs/docker/hdfs-parent.dockerfile -t reynoldsm88/hdfs-parent:latest .
	docker build -f hdfs/docker/hdfs-namenode.dockerfile -t reynoldsm88/hdfs-namenode:latest .
	docker build -f hdfs/docker/hdfs-datanode.dockerfile -t reynoldsm88/hdfs-datanode:latest .
	./build-tools --clean

build-hbase:
	./build-tools --hbase
	docker build -f hbase/docker/hbase-parent.dockerfile -t reynoldsm88/hbase-parent:latest .
	docker build -f hbase/docker/hbase-master.dockerfile -t reynoldsm88/hbase-master:latest .
	docker build -f hbase/docker/hbase-regionserver.dockerfile -t reynoldsm88/hbase-regionserver:latest .
	./build-tools --clean

build-spark: build-parent
	./build-tools --spark
	docker build -f spark/docker/spark-parent.dockerfile -t reynoldsm88/spark-parent:latest .
	docker build -f spark/docker/spark-master.dockerfile -t reynoldsm88/spark-master:latest .
	docker build -f spark/docker/spark-worker.dockerfile -t reynoldsm88/spark-worker:latest .
	./build-tools --clean

push-parent:
	docker push reynoldsm88/hadoop-parent:latest

push-hdfs:
	docker push reynoldsm88/hdfs-parent:latest
	docker push reynoldsm88/hdfs-namenode:latest
	docker push reynoldsm88/hdfs-datanode:latest

push-hbase:
	docker push reynoldsm88/hbase-parent:latest
	docker push reynoldsm88/hbase-master:latest
	docker push reynoldsm88/hbase-regionserver:latest

push-spark:
	docker push reynoldsm88/spark-parent:latest
	docker push reynoldsm88/spark-master:latest
	docker push reynoldsm88/spark-worker:latest

build-all: build-parent build-hdfs build-hbase build-spark

push-all: build-all push-parent push-hdfs push-hbase push-spark
	./build-tools --clean