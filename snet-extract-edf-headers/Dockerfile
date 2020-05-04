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

LABEL org.nrg.commands="[{\"inputs\": [{\"command-line-flag\": null, \"name\": \"project\", \"default-value\": null, \"sensitive\": null, \"matcher\": null, \"false-value\": null, \"required\": true, \"true-value\": null, \"replacement-key\": \"#PROJECT#\", \"command-line-separator\": null, \"type\": \"string\", \"description\": \"Input project\"}, {\"command-line-flag\": null, \"name\": \"subject\", \"default-value\": null, \"sensitive\": null, \"matcher\": null, \"false-value\": null, \"required\": true, \"true-value\": null, \"replacement-key\": \"#SUBJECT#\", \"command-line-separator\": null, \"type\": \"string\", \"description\": \"Input subject\"}, {\"command-line-flag\": null, \"name\": \"session\", \"default-value\": null, \"sensitive\": null, \"matcher\": null, \"false-value\": null, \"required\": true, \"true-value\": null, \"replacement-key\": \"#SESSION#\", \"command-line-separator\": null, \"type\": \"string\", \"description\": \"Input session\"}], \"description\": \"Extract EDF Headers from PSG Recording and write metadata back to XNAT\", \"command-line\": \"extract_edf_headers --project #PROJECT# --subject #SUBJECT# --session #SESSION#\", \"outputs\": [], \"image\": \"somnonetz/snet-extract-edf-headers:latest\", \"container-labels\": {}, \"override-entrypoint\": true, \"label\": \"Extract EDF Headers\", \"network\": \"snet-apps\", \"version\": \"1.5\", \"schema-version\": \"1.0\", \"xnat\": [{\"description\": \"Extract EDF Headers from PSG Recording and write metadata back to XNAT\", \"contexts\": [\"xnat:imageSessionData\"], \"name\": \"extract-edf-headers\", \"output-handlers\": [], \"label\": \"Extract EDF Headers\", \"external-inputs\": [{\"provides-value-for-command-input\": \"session\", \"name\": \"session\", \"default-value\": null, \"sensitive\": null, \"matcher\": null, \"required\": true, \"provides-files-for-command-mount\": null, \"replacement-key\": null, \"via-setup-command\": null, \"user-settable\": null, \"load-children\": false, \"type\": \"Session\", \"description\": \"Input session\"}], \"derived-inputs\": [{\"provides-value-for-command-input\": \"project\", \"name\": \"project\", \"default-value\": null, \"sensitive\": null, \"matcher\": null, \"required\": true, \"provides-files-for-command-mount\": null, \"replacement-key\": null, \"via-setup-command\": null, \"derived-from-xnat-object-property\": \"project-id\", \"user-settable\": false, \"derived-from-wrapper-input\": \"session\", \"load-children\": false, \"type\": \"string\", \"description\": null}, {\"provides-value-for-command-input\": \"subject\", \"name\": \"subject\", \"default-value\": null, \"sensitive\": null, \"matcher\": null, \"required\": true, \"provides-files-for-command-mount\": null, \"replacement-key\": null, \"via-setup-command\": null, \"derived-from-xnat-object-property\": \"subject-id\", \"user-settable\": false, \"derived-from-wrapper-input\": \"session\", \"load-children\": false, \"type\": \"string\", \"description\": null}]}], \"mounts\": [], \"environment-variables\": {}, \"type\": \"docker\", \"ports\": {}, \"name\": \"extract-edf-headers\"}]"