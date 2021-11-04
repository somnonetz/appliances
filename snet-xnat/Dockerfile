FROM node:lts-alpine AS builder

# build copla-editor

ARG COPLA_EDITOR_VER=d054137919797218e999577694cfd3ab263425a9

RUN apk add --no-cache git ca-certificates

RUN git clone https://github.com/somnonetz/copla-editor.git /tmp/copla-editor
COPY sn-editor-build.env /tmp/copla-editor/sn-editor/.env
RUN cd /tmp/copla-editor/sn-editor && git checkout ${COPLA_EDITOR_VER} && npm ci && npm run build

FROM tomcat:9-jdk8-openjdk-buster

ARG XNAT_VERSION=1.8.3
ARG XNAT_ROOT=/data/xnat
ARG XNAT_HOME=/data/xnat/home
ARG CATALINA_HOME=/usr/local/tomcat
ARG TOMCAT_XNAT_FOLDER_PATH=${CATALINA_HOME}/webapps/xnat

ARG XNAT_CONTAINER_SERVICE_VER=3.1.0
ARG SNET_PLUGIN_VER=0.2.0

# install xnat

ADD entrypoint.sh /usr/local/bin/entrypoint.sh

RUN apt-get update && apt-get install -y postgresql-client wget
RUN rm -rf ${CATALINA_HOME}/webapps/*
RUN mkdir -p \
        ${TOMCAT_XNAT_FOLDER_PATH} \
        ${XNAT_HOME}/config \
        ${XNAT_HOME}/logs \
        ${XNAT_HOME}/plugins \
        ${XNAT_HOME}/work \
        ${XNAT_ROOT}/archive \
        ${XNAT_ROOT}/build \
        ${XNAT_ROOT}/cache \
        ${XNAT_ROOT}/ftp \
        ${XNAT_ROOT}/pipeline \
        ${XNAT_ROOT}/prearchive
RUN wget --no-verbose --output-document=/tmp/xnat-web-${XNAT_VERSION}.war https://api.bitbucket.org/2.0/repositories/xnatdev/xnat-web/downloads/xnat-web-${XNAT_VERSION}.war
RUN unzip -o -d ${TOMCAT_XNAT_FOLDER_PATH} /tmp/xnat-web-${XNAT_VERSION}.war
RUN rm -f /tmp/xnat-web-${XNAT_VERSION}.war

# install copla-editor

COPY --from=builder /tmp/copla-editor/sn-editor/build ${CATALINA_HOME}/webapps/sn-editor

# install plugins

RUN wget https://bitbucket.org/xnatdev/container-service/downloads/container-service-${XNAT_CONTAINER_SERVICE_VER}-fat.jar && \
    mv container-service-${XNAT_CONTAINER_SERVICE_VER}-fat.jar ${XNAT_HOME}/plugins

RUN wget https://github.com/somnonetz/snet-plugin/releases/download/v${SNET_PLUGIN_VER}/snet-plugin-${SNET_PLUGIN_VER}.jar && \
    mv snet-plugin-${SNET_PLUGIN_VER}.jar ${XNAT_HOME}/plugins

EXPOSE 8080

CMD ["entrypoint.sh", "/usr/local/tomcat/bin/catalina.sh", "run"]

