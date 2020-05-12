FROM node:lts

ARG ASCLEPIOS_SSE_CLIENT_VER=0.1.6
ARG XNAT_DATA_CLIENT_VERSION=1.7.6

ENV NODE_PATH=/usr/local/lib/node_modules

RUN apt-get update && apt-get install -y \
    default-jre-headless && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g \
    asclepios-sse-client@${ASCLEPIOS_SSE_CLIENT_VER}

RUN wget https://bitbucket.org/xnatdev/data-client/downloads/XnatDataClient-${XNAT_DATA_CLIENT_VERSION}-all.jar -O /opt/XnatDataClient.jar

ADD XnatDataClient /usr/bin/XnatDataClient
ADD upload_subject /usr/bin/upload_subject
ADD upload_scan /usr/bin/upload_scan
