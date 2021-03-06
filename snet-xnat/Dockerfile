FROM tomcat:7-jre8-alpine

ARG XNAT_VER=1.7.6
ARG XNAT_LDAP_AUTH_PLUGIN_VER=1.0.0
ARG XNAT_CONTAINER_SERVICE_VER=2.1.1-SNAPSHOT
ARG SNET_PLUGIN_VER=0.1.8
ARG XNAT_ROOT=/data/xnat
ARG XNAT_HOME=/data/xnat/home
ARG TOMCAT_XNAT_FOLDER=xnat

WORKDIR /tmp

# install xnat

RUN apk add --no-cache \
        postgresql-client \
        wget \
    && \
    rm -rf $CATALINA_HOME/webapps/* && \
    mkdir -p \
        $CATALINA_HOME/webapps/${TOMCAT_XNAT_FOLDER} \
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
    cd $CATALINA_HOME/webapps/ && \
    wget https://api.bitbucket.org/2.0/repositories/xnatdev/xnat-web/downloads/xnat-web-${XNAT_VER}.war && \
    cd ${TOMCAT_XNAT_FOLDER} && \
    unzip -o ../xnat-web-${XNAT_VER}.war && \
    rm -f ../xnat-web-${XNAT_VER}.war

# install ldap auth provider plugin

RUN wget https://bitbucket.org/xnatx/ldap-auth-plugin/downloads/xnat-ldap-auth-plugin-${XNAT_LDAP_AUTH_PLUGIN_VER}.jar && \
    mv xnat-ldap-auth-plugin-${XNAT_LDAP_AUTH_PLUGIN_VER}.jar ${XNAT_HOME}/plugins

# install container service plugin

RUN wget https://bitbucket.org/xnatdev/container-service/downloads/containers-${XNAT_CONTAINER_SERVICE_VER}-fat.jar && \
    mv containers-${XNAT_CONTAINER_SERVICE_VER}-fat.jar ${XNAT_HOME}/plugins

# install snet-plugin

RUN wget https://github.com/somnonetz/snet-plugin/releases/download/v${SNET_PLUGIN_VER}/snet-plugin-${SNET_PLUGIN_VER}.jar && \
    mv snet-plugin-${SNET_PLUGIN_VER}.jar ${XNAT_HOME}/plugins

# clean up

RUN apk del wget

# set up

WORKDIR /

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
CMD ["entrypoint.sh", "/usr/local/tomcat/bin/catalina.sh", "run"]

EXPOSE 8080
