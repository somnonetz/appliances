FROM node:lts-alpine AS builder

ARG ASCLEPIOS_SEARCH_VER=905331262c6fe284faaf15378ffd3974c63af3ac
ARG COPLA_EDITOR_VER=de15827f2ed85f03dd6845bbcd0c077dd39ad11b

RUN apk add --no-cache git ca-certificates

RUN git clone https://github.com/somnonetz/snet-asclepios-search /tmp/asclepios-search && cd /tmp/asclepios-search && git checkout ${ASCLEPIOS_SEARCH_VER} && npm ci && npm run js-build && npm run css-build

RUN git clone https://github.com/somnonetz/copla-editor.git /tmp/copla-editor
COPY sn-editor-build.env /tmp/copla-editor/sn-editor/.env
RUN cd /tmp/copla-editor/sn-editor && git checkout ${COPLA_EDITOR_VER} && npm ci && npm run build

FROM nginx:1.18-alpine-perl

ARG WEB_ROOT=/var/www

COPY --from=builder /tmp/asclepios-search ${WEB_ROOT}/asclepios-search
COPY --from=builder /tmp/copla-editor/sn-editor/build ${WEB_ROOT}/copla-editor/sn-editor

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY snet.conf /etc/nginx/conf.d/snet.conf

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD ["nginx", "-g", "daemon off;"]
