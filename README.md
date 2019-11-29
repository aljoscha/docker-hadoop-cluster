## Building

```
make build
```

This fill fetch a Hadoop dist if necessary. The Hadoop version can be configured
in the Makefile or via `make build HADOOP_VERSION=<foobazzle>`.

## Running

```
make up
```

You can specify how many workers you want via `make up SCALE=42`, or change it
in the Makefile.

You can shut down the cluster using

```
make down
```
