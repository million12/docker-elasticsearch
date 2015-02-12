# Elasticsearch docker image 
[Docker Image](https://registry.hub.docker.com/u/million12/elasticsearch/) with [Elasticsearch](http://www.elasticsearch.org/) server. 

##### Installed Plugins:

1. Kibana [Docs](http://www.elasticsearch.org/overview/kibana/)
2. Marver [Docs](http://www.elasticsearch.org/overview/marvel/)

### Run 
`docker run \`  
`-d \`  
`--name elasticsearch \`  
`-p 9200:9200 \`  
`million12/elasticsearch`

### Custom Config 
User can use custom configuration file by adding `-v` option into run command (see example).  
Default configuration directory: `/opt/elasticsearch/config/`
  
`docker run \`  
`-d \`  
`--name elasticsearch \`  
`-p 9200:9200 \`  
`-v /path/to/myconfig.file:/opt/elasticsearch/config/elasticsearch.yml \`  
`million12/elasticsearch` 

### Kibana custom port
In case kibana needs other port than `9200` use environment variable `KIBANA_PORT`  
Example:  
`docker run \`  
`-d \`  
`--name elasticsearch \`  
`-p 9200:9200 \`  
`--env="KIBANA_PORT=80" \`  
`million12/elasticsearch`

### Kibana custom dashboard option
Using `KIBANA_DASHBOARD` environmental variable user can define default dashboard that will be loaded in Kibana3 interface.  

Possible options are :

Option | Description 
:-----:|------------
`logstash` | for logstash-like interface
`guided` | instrucions on screen for further custom configuration
`noted` | "Start here" version
`blank` | Blank (no content). If you want to configure everything yourself
`default` | Defaut Kibana3 dashboard. (used as default by this image)

Useage:  
`docker run \`  
`-d \`  
`--name elasticsearch \`  
`-p 9200:9200 \`  
`--env="KIBANA_DASHBOARD=logstash" \`  
`million12/elasticsearch`

### Access Web Interface
`htttp://elasticsearch_ip:9200/_plugin/marvel`  
`htttp://elasticsearch_ip:9200/_plugin/kibana3`

### SystemD .service file
For easy deployment using systemd we provide an example of `.service` file. See `systemd` directory

## Author(s)

Author: Marcin ryzy Ryzycki (<marcin@m12.io>)  
Author: Przemyslaw Ozgo (<linux@ozgo.info>)

---

**Sponsored by** [Typostrap.io - the new prototyping tool](http://typostrap.io/) for building highly-interactive prototypes of your website or web app. Built on top of TYPO3 Neos CMS and Zurb Foundation framework.
