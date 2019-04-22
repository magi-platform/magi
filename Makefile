info:
	echo "Available targets are 'clean', 'prune', 'killall', 'build-base', & 'build-hadoop'"

clean:
	docker images | awk '{print $$3}' | grep -v IMAGE | xargs docker rmi -f

prune:
	docker system prune -f

killall:
	docker ps -a | awk '{print $$1}' | grep -v CONTAINER | xargs docker rm -f

build-base:
	docker build -f docker/centos-jdk8.dockerfile -t reynoldsm88/centos-jdk8:latest .

build-hadoop:
	docker build -f docker/hadoop-parent.dockerfile -t reynoldsm88/hadoop-parent:latest .
	docker build -f docker/hdfs-namenode.dockerfile -t reynoldsm88/hdfs-namenode:latest .

build: build-base build-hadoop