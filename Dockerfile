FROM centos:centos7
MAINTAINER Marcin Ryzycki marcin@m12.io, Przemyslaw Ozgo linux@ozgo.info

RUN \
    rpm --rebuilddb && yum clean all && \
    yum install -y tar java-1.8.0-openjdk sudo && \
    yum clean all && \
    mkdir -p /opt/elasticsearch && \
    cd /opt/elasticsearch && \
    curl -O https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.0.0/elasticsearch-2.0.0.tar.gz && \
    tar zxvf elasticsearch-2.0.0.tar.gz -C /opt/elasticsearch --strip-components=1 && \
    rm -f elasticsearch-2.0.0.tar.gz && \
    /opt/elasticsearch/bin/plugin install license && \
    /opt/elasticsearch/bin/plugin install marvel-agent && \
    useradd elasticsearch && \
    chown -R elasticsearch:elasticsearch /opt/elasticsearch && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY container-files /

EXPOSE 9200

ENTRYPOINT ["/bootstrap.sh"]
