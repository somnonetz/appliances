#!/bin/sh

set -e

find /var/www/copla-editor/sn-editor/static/js/ -type f -exec sed -i "s,\${XNAT_API_URL},${XNAT_API_URL},g" {} \;
sed -i "s,\${TA_BASE_URL},${TA_BASE_URL},g" /var/www/asclepios-search/lib/sse.js
sed -i "s,\${SSE_SERVER_BASE_URL},${SSE_SERVER_BASE_URL},g" /var/www/asclepios-search/lib/sse.js
sed -i "s,\${SALT_VALUE},${SALT_VALUE},g" /var/www/asclepios-search/lib/sse.js
sed -i "s,\${IV_VALUE},${IV_VALUE},g" /var/www/asclepios-search/lib/sse.js

exec "$@"