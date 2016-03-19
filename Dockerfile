FROM centos:centos7
MAINTAINER Marcin Ryzycki marcin@m12.io, Przemyslaw Ozgo linux@ozgo.info

ENV ES_VERSION=2.2.1

RUN \
    rpm --rebuilddb && yum clean all && \
    yum install -y tar java-1.8.0-openjdk sudo && \
    yum clean all && \
    mkdir -p /opt/elasticsearch && \
    cd /opt/elasticsearch && \
    curl -O https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/${ES_VERSION}/elasticsearch-$ES_VERSION.tar.gz && \
    tar zxvf elasticsearch-${ES_VERSION}.tar.gz -C /opt/elasticsearch --strip-components=1 && \
    rm -f elasticsearch-${ES_VERSION}.tar.gz && \
    useradd elasticsearch && \
    chown -R elasticsearch:elasticsearch /opt/elasticsearch && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY container-files /

ENV MARVEL_SUPPORT=false

EXPOSE 9200

ENTRYPOINT ["/bootstrap.sh"]
