## Building

```
$ make build
```

This fill fetch a Hadoop dist if necessary. The Hadoop version can be configured
in the Makefile or via `make build HADOOP_VERSION=<foobazzle>`.

## Running

```
$ make up
```

You can specify how many workers you want via `make up SCALE=42`, or change it
in the Makefile.

You can shut down the cluster using

```
$ make down
```

## Building and Shipping Flink to Docker
```
$ mvn clean install -DskipTests -Dfast
$ cd -P build-target
$ cd ..
$ tar czf flink.tar.gz flink-*
$ docker cp flink.tar.gz master:/root
```
And then go into the container:
```
$ docker exec -it master bash
$ cd
$ tar xf flink.tar.gz
```

