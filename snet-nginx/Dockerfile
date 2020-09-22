FROM node:lts-alpine AS builder

ARG ASCLEPIOS_SEARCH_VER=71c547fe3e0f524d9fff7628f451b26bf6fda70b
ARG COPLA_EDITOR_VER=ef9bd437976a87601c6f7654912f48309a8828f0

RUN apk add --no-cache git ca-certificates
RUN git clone https://github.com/somnonetz/snet-asclepios-search /tmp/asclepios-search && cd /tmp/asclepios-search && git checkout ${ASCLEPIOS_SEARCH_VER}
RUN git clone https://github.com/somnonetz/copla-editor.git /tmp/copla-editor && cd /tmp/copla-editor && git checkout ${COPLA_EDITOR_VER}
COPY sn-editor-build.env /tmp/copla-editor/sn-editor/.env
RUN cd /tmp/copla-editor/sn-editor && npm install && npm run build

FROM nginx:1.13-alpine-perl

ARG WEB_ROOT=/var/www

COPY --from=builder /tmp/asclepios-search ${WEB_ROOT}/asclepios-search
COPY --from=builder /tmp/copla-editor/sn-editor/build ${WEB_ROOT}/copla-editor/sn-editor

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY snet.conf /etc/nginx/conf.d/snet.conf

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD ["nginx", "-g", "daemon off;"]
