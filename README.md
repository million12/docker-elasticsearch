# Elasticsearch docker image
[![CircleCI Build Status](https://img.shields.io/circleci/project/million12/docker-elasticsearch/master.svg)](https://circleci.com/gh/million12/docker-elasticsearch/tree/master)
[![GitHub Open Issues](https://img.shields.io/github/issues/million12/docker-elasticsearch.svg)](https://github.com/million12/docker-elasticsearch/issues)
[![GitHub Stars](https://img.shields.io/github/stars/million12/docker-elasticsearch.svg)](https://github.com/million12/docker-elasticsearch)
[![GitHub Forks](https://img.shields.io/github/forks/million12/docker-elasticsearch.svg)](https://github.com/million12/docker-elasticsearch)  
[![Stars on Docker Hub](https://img.shields.io/docker/stars/million12/elasticsearch.svg)](https://hub.docker.com/r/million12/elasticsearch)
[![Pulls on Docker Hub](https://img.shields.io/docker/pulls/million12/elasticsearch.svg)](https://hub.docker.com/r/million12/elasticsearch)  
[![Docker Layers](https://badge.imagelayers.io/million12/elasticsearch:latest.svg)](https://hub.docker.com/r/million12/elasticsearch)

[Docker Image](https://registry.hub.docker.com/u/million12/elasticsearch/) with [Elasticsearch](http://www.elasticsearch.org/) server (2.0.0).

This container is built that any extra parameters provided to `docker run` will be passed directly to `elasticsearch` command. For example, if you run `docker run [run options] million12/elasticsearch --cluster.name: my-cluser` you pass `--cluster.name my-cluster` to elasticsearch daemon.


### Installed Plugins:

2. Marvel [Docs](http://www.elasticsearch.org/overview/marvel/)

### Run
    docker run \
    -d \
    --name elasticsearch \
    -p 9200:9200 \
    million12/elasticsearch

### Custom Config
User can use custom configuration file by adding `-v` option into run command (see example).  
Default configuration directory: `/opt/elasticsearch/config/`  

    docker run \
    -d \
    --name elasticsearch \
    -p 9200:9200 \
    -v /path/to/myconfig.file:/opt/elasticsearch/config/elasticsearch.yml \
    million12/elasticsearch

### Access Web Interface
`htttp://elasticsearch_ip:9200`  

### SystemD .service file
For easy deployment using systemd we provide an example of `.service` file. See `systemd` directory

## Author(s)

Author: Marcin ryzy Ryzycki (<marcin@m12.io>)  
Author: Przemyslaw Ozgo (<linux@ozgo.info>)

---

**Sponsored by** [Typostrap.io - the new prototyping tool](http://typostrap.io/) for building highly-interactive prototypes of your website or web app. Built on top of TYPO3 Neos CMS and Zurb Foundation framework.
