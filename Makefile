IMAGE_PREFIX = magiplatform

build-hdfs:
	./build-tools --hadoop
	docker build --pull -f hadoop/docker/hadoop-parent.dockerfile -t $(IMAGE_PREFIX)/hadoop-parent:latest .
	docker build  -f hdfs/docker/hdfs-parent.dockerfile -t $(IMAGE_PREFIX)/hdfs-parent:latest .
	docker build  -f hdfs/docker/hdfs-namenode.dockerfile -t $(IMAGE_PREFIX)/hdfs-namenode:latest .
	docker build  -f hdfs/docker/hdfs-datanode.dockerfile -t $(IMAGE_PREFIX)/hdfs-datanode:latest .
	./build-tools --clean

build-hbase:
	./build-tools --hbase
	docker build -f hbase/docker/hbase-parent.dockerfile -t $(IMAGE_PREFIX)/hbase-parent:latest .
	docker build -f hbase/docker/hbase-master.dockerfile -t $(IMAGE_PREFIX)/hbase-master:latest .
	docker build -f hbase/docker/hbase-regionserver.dockerfile -t $(IMAGE_PREFIX)/hbase-regionserver:latest .
	./build-tools --clean

build-spark:
	./build-tools --spark
	docker build -f spark/docker/spark-parent.dockerfile -t $(IMAGE_PREFIX)/spark-parent:latest .
	docker build -f spark/docker/spark-master.dockerfile -t $(IMAGE_PREFIX)/spark-master:latest .
	docker build -f spark/docker/spark-worker.dockerfile -t $(IMAGE_PREFIX)/spark-worker:latest .
	./build-tools --clean

push-hdfs:
	docker push $(IMAGE_PREFIX)/hadoop-parent:latest
	docker push $(IMAGE_PREFIX)/hdfs-parent:latest
	docker push $(IMAGE_PREFIX)/hdfs-namenode:latest
	docker push $(IMAGE_PREFIX)/hdfs-datanode:latest

push-hbase:
	docker push $(IMAGE_PREFIX)/hbase-parent:latest
	docker push $(IMAGE_PREFIX)/hbase-master:latest
	docker push $(IMAGE_PREFIX)/hbase-regionserver:latest

push-spark:
	docker push $(IMAGE_PREFIX)/spark-parent:latest
	docker push $(IMAGE_PREFIX)/spark-master:latest
	docker push $(IMAGE_PREFIX)/spark-worker:latest

build-all: build-hdfs build-hbase build-spark

push-all: build-all push-hdfs push-hbase push-spark
	./build-tools --clean