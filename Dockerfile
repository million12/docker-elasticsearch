FROM million12/centos-supervisor
MAINTAINER Przemyslaw Ozgo <linux@ozgo.info>

RUN \
yum update -y && \
yum install -y tar java-1.7.0-openjdk && \
yum clean all && \

# Install Elasticsearch 

mkdir -p /opt/elasticsearch && \
cd /opt/elasticsearch && \
curl -O https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.2.tar.gz && \
tar zxvf elasticsearch-1.3.2.tar.gz -C /opt/elasticsearch --strip-components=1 && \
rm elasticsearch-1.3.2.tar.gz && \
/opt/elasticsearch/bin/plugin -i elasticsearch/marvel/latest && \
/opt/elasticsearch/bin/plugin -url http://download.elasticsearch.org/kibana/kibana/kibana-latest.zip -install elasticsearch/kibana3

ADD supervisord.conf /etc/supervisor.d/elasticsearch.conf

EXPOSE 9200
