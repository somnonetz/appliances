#!/bin/sh

set -e

cmd="$@"

find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s,\${XNAT_API_URL},${XNAT_API_URL},g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|ta_url|$TA_URL|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|sse_url|$SSE_URL|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|salt_value|$SALT|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|iv_value|$IV|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|iter_value|$ITER|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|ks_value|$KS|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|ts_value|$TS|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|mode_value|$MODE|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|adata_value|$ADATA|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|adata_len_value|$ADATA_LEN|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|hash_length_value|$HASH_LEN|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|chunk_size_value|$CHUNK_SIZE|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|no_chunks_per_upload_value|$NO_CHUNKS_PER_UPLOAD|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|salt_ta_value|$SALT_TA|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|iv_ta_value|$IV_TA|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|iter_ta_value|$ITER_TA|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|ks_ta_value|$KS_TA|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|ts_ta_value|$TS_TA|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|mode_ta_value|$MODE_TA|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|adata_ta_value|$ADATA_TA|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|adata_len_ta_value|$ADATA_LEN_TA|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|sgx_enable_value|$SGX_ENABLE|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|cp_abe_url|$CP_ABE_URL|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|debug_value|$DEBUG|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|auth_value|$AUTH|g" {} \;
find ${CATALINA_HOME}/webapps/sn-editor/static/js/ -type f -exec sed -i "s|small_file_value|$SMALL_FILE|g" {} \;

sed -i -e "s|ta_url|$TA_URL|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|sse_url|$SSE_URL|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|salt_value|$SALT|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|iv_value|$IV|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|iter_value|$ITER|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|ks_value|$KS|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|ts_value|$TS|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|mode_value|$MODE|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|adata_value|$ADATA|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|adata_len_value|$ADATA_LEN|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|hash_length_value|$HASH_LEN|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|chunk_size_value|$CHUNK_SIZE|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|no_chunks_per_upload_value|$NO_CHUNKS_PER_UPLOAD|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|salt_ta_value|$SALT_TA|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|iv_ta_value|$IV_TA|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|iter_ta_value|$ITER_TA|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|ks_ta_value|$KS_TA|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|ts_ta_value|$TS_TA|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|mode_ta_value|$MODE_TA|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|adata_ta_value|$ADATA_TA|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|adata_len_ta_value|$ADATA_LEN_TA|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|sgx_enable_value|$SGX_ENABLE|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|cp_abe_url|$CP_ABE_URL|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|debug_value|$DEBUG|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|auth_value|$AUTH|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;
sed -i -e "s|small_file_value|$SMALL_FILE|" ${CATALINA_HOME}/webapps/asclepios-search/lib/sse.js;

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
