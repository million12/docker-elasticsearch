FROM centos:centos7
MAINTAINER Marcin Ryzycki marcin@m12.io, Przemyslaw Ozgo linux@ozgo.info

RUN \
    yum update -y && \
    yum install -y tar java-1.7.0-openjdk && \
    yum clean all && \
    # Install Elasticsearch
    mkdir -p /opt/elasticsearch && \
    cd /opt/elasticsearch && \
    curl -O https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.2.tar.gz && \
    tar zxvf elasticsearch-1.4.2.tar.gz -C /opt/elasticsearch --strip-components=1 && \
    rm -f elasticsearch-1.4.2.tar.gz && \
    /opt/elasticsearch/bin/plugin -i elasticsearch/marvel/latest && \
    /opt/elasticsearch/bin/plugin -url http://download.elasticsearch.org/kibana/kibana/kibana-latest.zip -install elasticsearch/kibana3

ENV KIBANA_PORT 9200
ENV KIBANA_DASHBOARD default

COPY start.sh /

CMD /start.sh

EXPOSE 9200
