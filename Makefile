IMAGE_PREFIX = reynoldsm88/
IMAGE_NAME = magi
IMG := $(IMAGE_PREFIX)$(IMAGE_NAME)

prepare:
	./download.sh

build-parent: prepare
	docker build -f hadoop/docker/hadoop-parent.dockerfile -t reynoldsm88/hadoop-parent:latest .

build-hdfs: build-parent
	docker build -f hdfs/docker/hdfs-parent.dockerfile -t reynoldsm88/hdfs-parent:latest .
	docker build -f hdfs/docker/hdfs-namenode.dockerfile -t reynoldsm88/hdfs-namenode:latest .
	docker build -f hdfs/docker/hdfs-datanode.dockerfile -t reynoldsm88/hdfs-datanode:latest .

build-hbase: build-parent
	docker build -f hbase/docker/hbase-parent.dockerfile -t reynoldsm88/hbase-parent:latest .
	docker build -f hbase/docker/hbase-master.dockerfile -t reynoldsm88/hbase-master:latest .
	docker build -f hbase/docker/hbase-regionserver.dockerfile -t reynoldsm88/hbase-regionserver:latest .

push-parent: build-parent
	docker push reynoldsm88/hadoop-parent:latest

push-hdfs: build-hdfs
	docker push reynoldsm88/hdfs-parent:latest
	docker push reynoldsm88/hdfs-namenode:latest
	docker push reynoldsm88/hdfs-datanode:latest

push-hbase: build-hbase
	docker push reynoldsm88/hbase-parent:latest
	docker push reynoldsm88/hbase-master:latest
	docker push reynoldsm88/hbase-regionserver:latest

build-all: build-parent build-hdfs build-hbase

push-all: build-all push-parent push-hdfs push-hbase
