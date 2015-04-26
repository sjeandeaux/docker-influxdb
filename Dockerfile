FROM centos:latest

MAINTAINER Stéphane Jeandeaux <stephane.jeandeaux@gmail.com>

#copy sh to run influxdb and configuration by default.
COPY influxdb.toml influxdb.sh /influxdb/
ENV CONFIG /influxdb/influxdb.toml

#install and redirect logs 
RUN curl https://s3.amazonaws.com/influxdb/influxdb-latest-1.x86_64.rpm \
       -o /tmp/influxdb.rpm \
    #install influxdb
    && rpm -ivh /tmp/influxdb.rpm \
    #command start influxdb
    && chmod +x /influxdb/influxdb.sh \
    #log with docker
    && ln -sf /dev/stdout /opt/influxdb/shared/log.txt

VOLUME ["/opt/influxdb/shared/data"]

# EXPOSE PORT GRAPHITE, ADMIN, API
EXPOSE 2003 8083 8086

#GO...
CMD ["/influxdb/influxdb.sh"]
