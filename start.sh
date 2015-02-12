#!/bin/sh

set -u
set -e

# Check if user defined port.
if [ "${KIBANA_PORT}" != 9200 ]; then
    sed -i 's/9200/'${KIBANA_PORT}'/g' /opt/elasticsearch/plugins/kibana3/_site/config.js
fi
# Check if user defined dashboard version
if [ "${KIBANA_DASHBOARD}" != "default" ]; then
    sed -i 's/default.json/'${KIBANA_DASHBOARD}'.json/g' /opt/elasticsearch/plugins/kibana3/_site/config.js
fi

/opt/elasticsearch/bin/elasticsearch