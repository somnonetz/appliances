#!/bin/sh

set -e

find /var/www/copla-editor/sn-editor/static/js/ -type f -exec sed -i "s,\${XNAT_API_URL},${XNAT_API_URL},g" {} \;
find /var/www/copla-editor/sn-editor/static/js/ -type f -exec sed -i "s,\${SSE_CLIENT_SSE_SERVER_URL},${SSE_CLIENT_SSE_SERVER_URL},g" {} \;
find /var/www/copla-editor/sn-editor/static/js/ -type f -exec sed -i "s,\${SSE_CLIENT_TA_URL},${SSE_CLIENT_TA_URL},g" {} \; 
find /var/www/copla-editor/sn-editor/static/js/ -type f -exec sed -i "s,\${SSE_CLIENT_SALT_VALUE},${SSE_CLIENT_SALT_VALUE},g" {} \;
find /var/www/copla-editor/sn-editor/static/js/ -type f -exec sed -i "s,\${SSE_CLIENT_IV_VALUE},${SSE_CLIENT_IV_VALUE},g" {} \;
find /var/www/copla-editor/sn-editor/static/js/ -type f -exec sed -i "s,\${KEYCLOAK_HOST},${KEYCLOAK_HOST},g" {} \;

sed -i "s,\${SSE_CLIENT_SSE_SERVER_URL},${SSE_CLIENT_SSE_SERVER_URL},g" /var/www/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_TA_URL},${SSE_CLIENT_TA_URL},g" /var/www/asclepios-search/lib/sse.js; 
sed -i "s,\${SSE_CLIENT_SALT_VALUE},${SSE_CLIENT_SALT_VALUE},g" /var/www/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_IV_VALUE},${SSE_CLIENT_IV_VALUE},g" /var/www/asclepios-search/lib/sse.js;
sed -i "s,\${KEYCLOAK_HOST},${KEYCLOAK_HOST},g" /var/www/asclepios-search/keycloak.json;
sed -i "s,\${KEYCLOAK_HOST},${KEYCLOAK_HOST},g" /var/www/asclepios-search/index.html;

exec "$@"
