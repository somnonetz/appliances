#!/bin/sh

set -e

cmd="$@"

find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s,\${XNAT_API_URL},${XNAT_API_URL},g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s,\${SSE_CLIENT_SSE_SERVER_URL},${SSE_CLIENT_SSE_SERVER_URL},g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s,\${SSE_CLIENT_TA_URL},${SSE_CLIENT_TA_URL},g" {} \; 
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s,\${SSE_CLIENT_SALT_VALUE},${SSE_CLIENT_SALT_VALUE},g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s,\${SSE_CLIENT_IV_VALUE},${SSE_CLIENT_IV_VALUE},g" {} \;

sed -i "s,\${SSE_CLIENT_SSE_SERVER_URL},${SSE_CLIENT_SSE_SERVER_URL},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_TA_URL},${SSE_CLIENT_TA_URL},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js; 
sed -i "s,\${SSE_CLIENT_SALT_VALUE},${SSE_CLIENT_SALT_VALUE},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_IV_VALUE},${SSE_CLIENT_IV_VALUE},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_TA_URL},${SSE_CLIENT_TA_URL},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_SSE_SERVER_URL},${SSE_CLIENT_SSE_SERVER_URL},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_SALT},${SSE_CLIENT_SALT},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_IV},${SSE_CLIENT_IV},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_ITER},${SSE_CLIENT_ITER},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_KS},${SSE_CLIENT_KS},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_TS},${SSE_CLIENT_TS},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_HASH_LEN},${SSE_CLIENT_HASH_LEN},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_CHUNK_SIZE},${SSE_CLIENT_CHUNK_SIZE},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_NO_CHUNKS_PER_UPLOAD},${SSE_CLIENT_NO_CHUNKS_PER_UPLOAD},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_SALT_TA},${SSE_CLIENT_SALT_TA},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_IV_TA},${SSE_CLIENT_IV_TA},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_ITER_TA},${SSE_CLIENT_ITER_TA},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_KS_TA},${SSE_CLIENT_KS_TA},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_TS_TA},${SSE_CLIENT_TS_TA},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_SGX_ENABLE},${SSE_CLIENT_SGX_ENABLE},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i "s,\${SSE_CLIENT_CP_ABE_URL},${SSE_CLIENT_CP_ABE_URL},g" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;

sed -i "s,\${KEYCLOAK_HOST},${KEYCLOAK_HOST},g" ${CATALINA_HOME}/webapps/asclepios-search/index.html;
sed -i "s,\${KEYCLOAK_HOST},${KEYCLOAK_HOST},g" ${CATALINA_HOME}/webapps/asclepios-search/create.html;
sed -i "s,\${KEYCLOAK_HOST},${KEYCLOAK_HOST},g" ${CATALINA_HOME}/webapps/ROOT/keycloak.json;

# "s,\${SSE_CLIENT_TA_URL},${SSE_CLIENT_TA_URL},g" 
# "s,\${SSE_CLIENT_SSE_SERVER_URL},${SSE_CLIENT_SSE_SERVER_URL},g" 
# "s,\${SSE_CLIENT_SALT},${SSE_CLIENT_SALT},g" 
# "s,\${SSE_CLIENT_IV},${SSE_CLIENT_IV},g" 
# "s,\${SSE_CLIENT_ITER},${SSE_CLIENT_ITER},g" 
# "s,\${SSE_CLIENT_KS},${SSE_CLIENT_KS},g" 
# "s,\${SSE_CLIENT_TS},${SSE_CLIENT_TS},g" 
# "s,\${SSE_CLIENT_HASH_LEN},${SSE_CLIENT_HASH_LEN},g" 
# "s,\${SSE_CLIENT_CHUNK_SIZE},${SSE_CLIENT_CHUNK_SIZE},g" 
# "s,\${SSE_CLIENT_NO_CHUNKS_PER_UPLOAD},${SSE_CLIENT_NO_CHUNKS_PER_UPLOAD},g" 
# "s,\${SSE_CLIENT_SALT_TA},${SSE_CLIENT_SALT_TA},g" 
# "s,\${SSE_CLIENT_IV_TA},${SSE_CLIENT_IV_TA},g" 
# "s,\${SSE_CLIENT_ITER_TA},${SSE_CLIENT_ITER_TA},g" 
# "s,\${SSE_CLIENT_KS_TA},${SSE_CLIENT_KS_TA},g" 
# "s,\${SSE_CLIENT_TS_TA},${SSE_CLIENT_TS_TA},g" 
# "s,\${SSE_CLIENT_SGX_ENABLE},${SSE_CLIENT_SGX_ENABLE},g" 
# "s,\${SSE_CLIENT_CP_ABE_URL},${SSE_CLIENT_CP_ABE_URL},g" 

# generate xnat config
if [ ! -f $XNAT_HOME/config/xnat-conf.properties ]; then
  cat > $XNAT_HOME/config/xnat-conf.properties << EOF
datasource.driver=$XNAT_DATASOURCE_DRIVER
datasource.url=$XNAT_DATASOURCE_URL
datasource.username=$XNAT_DATASOURCE_USERNAME
datasource.password=$XNAT_DATASOURCE_PASSWORD
hibernate.dialect=$XNAT_HIBERNATE_DIALECT
hibernate.hbm2ddl.auto=update
hibernate.show_sql=false
hibernate.cache.use_second_level_cache=true
hibernate.cache.use_query_cache=true


spring.http.multipart.max-file-size=1073741824
spring.http.multipart.max-request-size=1073741824
EOF
fi

if [ ! -z "${XNAT_EMAIL}" ]; then
  cat > ${XNAT_HOME}/config/prefs-init.ini << EOF
[siteConfig]
adminEmail=${XNAT_EMAIL}
EOF
fi


# wait for postgres
until psql -U "$XNAT_DATASOURCE_USERNAME" -h xnat-db -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 5
done

>&2 echo "Postgres is up - executing command \"$cmd\""
exec $cmd
