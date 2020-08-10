FROM nginx:1.13-alpine-perl

ARG COPLA_EDITOR_VER=0.2.1
ARG ASCLEPIOS_SEARCH_VER=0.1.8
ARG WEB_ROOT=/var/www


RUN apk add --no-cache wget ca-certificates && \
    update-ca-certificates && \
    mkdir -p ${WEB_ROOT} && \
    wget https://github.com/somnonetz/snet-asclepios-search/archive/v${ASCLEPIOS_SEARCH_VER}/v${ASCLEPIOS_SEARCH_VER}.tar.gz && \
    tar -zxf v${ASCLEPIOS_SEARCH_VER}.tar.gz && \
    mv  snet-asclepios-search-${ASCLEPIOS_SEARCH_VER} ${WEB_ROOT}/asclepios-search && \
    rm -f v${ASCLEPIOS_SEARCH_VER}.tar.gz && \
    mkdir -p ${WEB_ROOT}/copla-editor && \
    wget https://github.com/somnonetz/copla-editor/releases/download/v${COPLA_EDITOR_VER}/sn-editor-${COPLA_EDITOR_VER}.tar.gz && \
    tar -zxf sn-editor-${COPLA_EDITOR_VER}.tar.gz && \
    mv sn-editor ${WEB_ROOT}/copla-editor/sn-editor && \
    rm -f sn-editor-${COPLA_EDITOR_VER}.tar.gz

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY xnat.conf /etc/nginx/conf.d/xnat.conf

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD ["nginx", "-g", "daemon off;"]

