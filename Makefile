.PHONY: build clean up down

HADOOP_VERSION=2.8.4
SCALE=2

build: hadoop-base/hadoop-${HADOOP_VERSION}.tar.gz
	docker build --build-arg HADOOP_VERSION=${HADOOP_VERSION} -t aljoscha/hadoop-base:latest hadoop-base
	docker build --build-arg HADOOP_VERSION=${HADOOP_VERSION} -t aljoscha/hadoop-master:latest hadoop-master
	docker build --build-arg HADOOP_VERSION=${HADOOP_VERSION} -t aljoscha/hadoop-slave:latest hadoop-slave
	docker-compose build

hadoop-base/hadoop-${HADOOP_VERSION}.tar.gz:
	wget http://archive.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz
	mv hadoop-${HADOOP_VERSION}.tar.gz hadoop-base/

up:
	docker-compose up -d --scale slave=${SCALE}
	echo "http://localhost:9870 for HDFS"
	echo "http://localhost:8088 for YARN"

down:
	docker-compose down
