# Start with latest CentOS image
FROM centos

# Switch to root user
USER root

# Update yum
RUN yum update -y

# Install tar
RUN yum install -y tar

# Install java
RUN yum install -y java-1.7.0-openjdk

## Install hbase from local
#ADD hbase-1.0.0-bin.tar.gz /usr/local/hbase

## Install hbase from apache
WORKDIR /usr/local/hbase
RUN curl -SsfLO "http://apache.mirror.anlx.net/hbase/hbase-1.0.0/hbase-1.0.0-bin.tar.gz"
RUN tar -xvzf /usr/local/hbase/hbase-1.0.0-bin.tar.gz

# Set JAVA_HOME (used by HBase)
ENV JAVA_HOME /usr/lib/jvm/jre-1.7.0-openjdk

# Insert config file from local
ADD hbase-site.xml /usr/local/hbase/hbase-1.0.0/conf/hbase-site.xml

# EXPOSE PORTS
# zookeeper
EXPOSE 2181
# HBase Master API port
EXPOSE 16000
# HBase Master Web UI
EXPOSE 16010
# Regionserver API port
EXPOSE 16020
# HBase Regionserver web UI
EXPOSE 16030
# HBase REST API
EXPOSE 8070

CMD /usr/local/hbase/hbase-1.0.0/bin/hbase master start
