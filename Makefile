clean:
	docker images | grep reynoldsm88 | grep -v IMAGE | awk '{print $3}'

build-base:
	docker build -f docker/centos-jdk8.dockerfile -t reynoldsm88/centos-jdk8:latest .

build-hadoop:
	docker build -f docker/hadoop-parent.dockerfile -t reynoldsm88/hadoop-parent:latest .

build: build-base build-hadoop	
