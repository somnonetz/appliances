FROM python:3-alpine

RUN apk add --no-cache \
        build-base \
        python3 \
        libxml2 \
        libxslt \
        python3-dev \
        libxml2-dev \
        libxslt-dev \
    && \
    pip3 install --no-cache-dir \
        six \
        edfrd \
        pyxnat \
    && \
    apk del build-base python3-dev libxml2-dev libxslt-dev

ADD extract_edf_headers /usr/bin/extract_edf_headers
