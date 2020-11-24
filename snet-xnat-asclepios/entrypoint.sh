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
sed -i "s,\${KEYCLOAK_HOST},${KEYCLOAK_HOST},g" ${CATALINA_HOME}/webapps/asclepios-search/index.html;
sed -i "s,\${KEYCLOAK_HOST},${KEYCLOAK_HOST},g" ${CATALINA_HOME}/webapps/asclepios-search/create.html;
sed -i "s,\${KEYCLOAK_HOST},${KEYCLOAK_HOST},g" ${CATALINA_HOME}/webapps/ROOT/keycloak.json;


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
EOF
fi

# wait for postgres
until psql -U "$XNAT_DATASOURCE_USERNAME" -h xnat-db -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 5
done

>&2 echo "Postgres is up - executing command \"$cmd\""
exec $cmd
