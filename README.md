# Docker - Influxdb

## Build image

```shell
make build

docker build -t sjeandeaux/docker-influxdb 
```

TIP: with [proxy](https://gist.github.com/sjeandeaux/b752e3d593ad6cdb2485) 
 (docker build -t sjeandeaux/docker-influxdb -f docker-proxy-file )

## Run influxdb

### Basically

This command starts influxdb with default configuration


```shell
make run

docker run -d --name runInfluxdb -p 8083:8083 -p 8086:8086  \
           -v $(pwd)/data:/opt/influxdb/shared/data \
           sjeandeaux/docker-influxdb
```

### Overwrite

This command starts a container with a configuration outside (we can use https, change configuration,)


```shell
make -f MakefileTest run

docker run -d --name runInfluxdb -p 8083:8083 -p 8086:8086 \
           -e CONFIG=/influxdb/overwrite/influxdb.toml \
           -v $(pwd)/data:/opt/influxdb/shared/data \
           -v $(pwd)/test/overwrite:/influxdb/overwrite \
           sjeandeaux/docker-influxdb
```

### Test


```shell
make -f MakefileTest run
make -f MakefileTest create-db-graphite
make -f MakefileTest create-user-graphite
make -f MakefileTest send
```

### FROM sjeandeaux/docker-influxdb

[see](https://github.com/sjeandeaux/docker-influxdb-graphite)
