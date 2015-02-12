#Elasticsearch docker image 
[Docker Image](https://registry.hub.docker.com/u/million12/elasticsearch/) with [Elasticsearch](http://www.elasticsearch.org/) server. 

Plugins Installed:

1. Kibana 
2. Marver

###Run 
`docker run -d --name elasticsearch -p 9200:9200 million12/elasticsearch`

### Custom Config 
User can use custom configuration file by adding `-v` option into run command (see example).  
Default configuration directory: `/opt/elasticsearch/config/`
  
`docker run -d --name elasticsearch -p 9200:9200 -v /path/to/myconfig.file:/opt/elasticsearch/config/elasticsearch.yml million12/elasticsearch` 

### Kibana custom port
In case kibana needs other port than `9200` use environment variable `KIBANA_PORT`  
Example:  
`docker run -f --name elasticsearch -p 9200:9200 -e KIBANA_PORT="80" million12/elasticsearch`


###Access Web Interface
`htttp://elasticsearch_ip:9200/_plugin/marvel`  
`htttp://elasticsearch_ip:9200/_plugin/kibana3`

### SystemD .service file
For easy deployment using systemd we provide an example of `.service` file. See `systemd` directory

## Author(s)

Author: Marcin ryzy Ryzycki (<marcin@m12.io>)  
Author: Przemyslaw Ozgo (<linux@ozgo.info>)

---

**Sponsored by** [Typostrap.io - the new prototyping tool](http://typostrap.io/) for building highly-interactive prototypes of your website or web app. Built on top of TYPO3 Neos CMS and Zurb Foundation framework.
