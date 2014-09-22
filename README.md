#Elasticsearch docker image 
Based on million12/centos-supervisor docker image. 

Plugins Installed:

1. Kibana 3.1.0
2. Marver

###Run 
`docker run -d --name elasticsearch -p 9200:9200 million12/elasticsearch`

###Access Web Interface
>   htttp://elasticsearch_ip:9200/_plugin/marvel

>   htttp://elasticsearch_ip:9200/_plugin/kibana3