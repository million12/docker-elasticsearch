#!/bin/sh

set -u
set -e

if [ "${KIBANA_PORT}" != 9200 ]; then
    sed -i 's/9200/'${KIBANA_PORT}'/g' /opt/elasticsearch/plugins/kibana3/_site/config.js
fi

/opt/elasticsearch/bin/elasticsearch