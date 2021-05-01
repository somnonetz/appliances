FROM node:lts-alpine AS builder

# build webapps

ARG ASCLEPIOS_SEARCH_VER=0f10f5cb5f88c36db80b235ee668031928d863ad
ARG COPLA_EDITOR_VER=01f3d80fa0326380fa1d73dff6a808f7e348dd06

RUN apk add --no-cache git ca-certificates

RUN git clone https://github.com/somnonetz/snet-asclepios-search /tmp/asclepios-search && cd /tmp/asclepios-search && git checkout ${ASCLEPIOS_SEARCH_VER} && npm ci && npm run js-build && npm run css-build

RUN git clone https://github.com/somnonetz/copla-editor.git /tmp/copla-editor
COPY sn-editor-build.env /tmp/copla-editor/sn-editor/.env
RUN cd /tmp/copla-editor/sn-editor && git checkout ${COPLA_EDITOR_VER} && npm ci && npm run build

FROM tomcat:7-jre8-alpine

ARG XNAT_VER=1.8.0
# ARG XNAT_LDAP_AUTH_PLUGIN_VER=1.0.0
ARG XNAT_OPENID_AUTH_PLUGIN_VER=1.0.2
# ARG XNAT_CONTAINER_SERVICE_VER=2.1.1-SNAPSHOT
ARG SNET_ASCLEPIOS_PLUGIN_VER=0.1.0
ARG XNAT_ROOT=/data/xnat
ARG XNAT_HOME=/data/xnat/home
ARG TOMCAT_XNAT_FOLDER=xnat
ARG CATALINA_HOME=/usr/local/tomcat

WORKDIR /tmp

# install xnat

RUN apk add --no-cache \
        postgresql-client \
        wget \
    && \
    rm -rf ${CATALINA_HOME}/webapps/* && \
    mkdir -p \
        ${CATALINA_HOME}/webapps/${TOMCAT_XNAT_FOLDER} \
        ${XNAT_HOME}/config \
        ${XNAT_HOME}/logs \
        ${XNAT_HOME}/plugins \
        ${XNAT_HOME}/work \
        ${XNAT_ROOT}/archive \
        ${XNAT_ROOT}/build \
        ${XNAT_ROOT}/cache \
        ${XNAT_ROOT}/ftp \
        ${XNAT_ROOT}/pipeline \
        ${XNAT_ROOT}/prearchive \
    && \
    cd ${CATALINA_HOME}/webapps/ && \
    wget https://api.bitbucket.org/2.0/repositories/xnatdev/xnat-web/downloads/xnat-web-${XNAT_VER}.war && \
    cd ${TOMCAT_XNAT_FOLDER} && \
    unzip -o ../xnat-web-${XNAT_VER}.war && \
    rm -f ../xnat-web-${XNAT_VER}.war

# install webapps 

COPY --from=builder /tmp/copla-editor/sn-editor/build ${CATALINA_HOME}/webapps/sn-editor 
COPY --from=builder /tmp/asclepios-search ${CATALINA_HOME}/webapps/asclepios-search
COPY keycloak.json ${CATALINA_HOME}/webapps/ROOT/keycloak.json

# install ldap auth provider plugin

# RUN wget https://bitbucket.org/xnatx/ldap-auth-plugin/downloads/xnat-ldap-auth-plugin-${XNAT_LDAP_AUTH_PLUGIN_VER}.jar && \
#    mv xnat-ldap-auth-plugin-${XNAT_LDAP_AUTH_PLUGIN_VER}.jar ${XNAT_HOME}/plugins

# install openid auth provider plugin
RUN wget https://github.com/Australian-Imaging-Service/xnat-openid-auth-plugin/releases/download/1.0.2/xnat-openid-auth-plugin-all-${XNAT_OPENID_AUTH_PLUGIN_VER}.jar && \
    mv xnat-openid-auth-plugin-all-${XNAT_OPENID_AUTH_PLUGIN_VER}.jar ${XNAT_HOME}/plugins

# install container service plugin

# RUN wget https://bitbucket.org/xnatdev/container-service/downloads/containers-${XNAT_CONTAINER_SERVICE_VER}-fat.jar && \
#    mv containers-${XNAT_CONTAINER_SERVICE_VER}-fat.jar ${XNAT_HOME}/plugins

# install snet-asclepios-plugin

RUN wget https://github.com/somnonetz/snet-asclepios-plugin/releases/download/v${SNET_ASCLEPIOS_PLUGIN_VER}/snet-asclepios-plugin-${SNET_ASCLEPIOS_PLUGIN_VER}.jar && \
    mv snet-asclepios-plugin-${SNET_ASCLEPIOS_PLUGIN_VER}.jar ${XNAT_HOME}/plugins

# clean up

RUN apk del wget

# bootstrap

WORKDIR /

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
CMD ["entrypoint.sh", "/usr/local/tomcat/bin/catalina.sh", "run"]

EXPOSE 8080
