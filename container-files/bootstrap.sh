#!/bin/sh
export TERM=xterm
set -u

# Fix data ownership
mkdir -p /opt/elasticsearch/data
chown -R elasticsearch:elasticsearch /opt/elasticsearch/data

# User params
ELASTICSEARCH_CONFIG="/opt/elasticsearch/config/elasticsearch.yml"
ELASTICSEARCH_USER_PARAMS=$@

#######################################
# Echo/log function
# Arguments:
#   String: value to log
#######################################
log() {
  if [[ "$@" ]]; then echo "[`date +'%Y-%m-%d %T'`] $@";
  else echo; fi
}

#######################################
# Dump current $ELASTICSEARCH_CONFIG
#######################################
print_config() {
  log "Current Elasticsearch config ${ELASTICSEARCH_CONFIG}:"
  printf '=%.0s' {1..100} && echo
  cat ${ELASTICSEARCH_CONFIG}
  printf '=%.0s' {1..100} && echo
}

# Launch Elasticsearch.
print_config
su elasticsearch -c "/opt/elasticsearch/bin/elasticsearch --network.bind_host 0.0.0.0 --network.publish_host _non_loopback:ipv4_ ${ELASTICSEARCH_USER_PARAMS}"
