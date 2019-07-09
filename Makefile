IMAGE_PREFIX = reynoldsm88/
IMAGE_NAME = magi
IMG := $(IMAGE_PREFIX)$(IMAGE_NAME)

info:
	@echo "Available targets are 'clean', 'clean-all', 'build-parent', 'build-hdfs', 'build-hbase' & 'build-all'"

clean:
	docker images | awk '{print $$3}' | grep -v IMAGE | xargs docker rmi -f

clean-all: clean 
	docker system prune -f

build-parent:
	docker build -f docker/hadoop-parent.dockerfile -t reynoldsm88/hadoop-parent:latest .

build-hdfs:
	docker build -f docker/hdfs-parent.dockerfile -t reynoldsm88/hdfs-parent:latest .
	docker build -f docker/hdfs-namenode.dockerfile -t reynoldsm88/hdfs-namenode:latest .
	docker build -f docker/hdfs-datanode.dockerfile -t reynoldsm88/hdfs-datanode:latest .

build-hbase:
	docker build -f docker/hbase-parent.dockerfile -t reynoldsm88/hbase-parent:latest .
	docker build -f docker/hbase-master.dockerfile -t reynoldsm88/hbase-master:latest .
	docker build -f docker/hbase-regionserver.dockerfile -t reynoldsm88/hbase-regionserver:latest .

build-all: build-parent build-hdfs build-hbase
