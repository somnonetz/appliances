FROM nginx:1.13-alpine-perl

ARG COPLA_EDITOR_VER=0.1.6-generic
ARG ASCLEPIOS_SEARCH_VER=0.1.2
ARG WEB_ROOT=/var/www

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx

RUN apk add --no-cache wget ca-certificates && \
    update-ca-certificates && \
    mkdir -p ${WEB_ROOT} && \
    wget https://github.com/somnonetz/snet-asclepios-search/archive/v${ASCLEPIOS_SEARCH_VER}/v${ASCLEPIOS_SEARCH_VER}.tar.gz && \
    tar -zxf v${ASCLEPIOS_SEARCH_VER}.tar.gz && \
    mv  snet-asclepios-search-${ASCLEPIOS_SEARCH_VER} /var/www/asclepios-search && \
    rm -f v${ASCLEPIOS_SEARCH_VER}.tar.gz && \
    mkdir -p ${WEB_ROOT}/copla-editor && \
    wget https://github.com/somnonetz/copla-editor/releases/download/v${COPLA_EDITOR_VER}/sn-editor-${COPLA_EDITOR_VER}.tar.gz && \
    tar -zxf sn-editor-${COPLA_EDITOR_VER}.tar.gz && \
    mv sn-editor /var/www/copla-editor/sn-editor && \
    rm -f sn-editor-${COPLA_EDITOR_VER}.tar.gz && \
    wget https://github.com/somnonetz/copla-editor/releases/download/v${COPLA_EDITOR_VER}/sn-webrtc-${COPLA_EDITOR_VER}.tar.gz && \
    tar -zxf sn-webrtc-${COPLA_EDITOR_VER}.tar.gz && \
    mv sn-webrtc /var/www/copla-editor/sn-webrtc && \
    rm -f sn-webrtc-${COPLA_EDITOR_VER}.tar.gz && \
    apk del wget

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]