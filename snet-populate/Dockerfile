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
        faker \
        xnat \
    && \
    apk del build-base python3-dev libxml2-dev libxslt-dev

ADD populate_subjects /usr/bin/populate_subjects

LABEL org.nrg.commands="[{\"inputs\": [{\"command-line-flag\": null, \"name\": \"project\", \"default-value\": null, \"sensitive\": null, \"matcher\": null, \"false-value\": null, \"required\": true, \"true-value\": null, \"replacement-key\": \"#PROJECT#\", \"command-line-separator\": null, \"type\": \"string\", \"description\": \"Input project\"}, {\"command-line-flag\": null, \"name\": \"num_subjects\", \"default-value\": null, \"sensitive\": null, \"matcher\": null, \"false-value\": null, \"required\": true, \"true-value\": null, \"replacement-key\": \"#NUM_SUBJECTS#\", \"command-line-separator\": null, \"type\": \"number\", \"description\": \"Number of subjects to generate\"}], \"description\": \"Populate a project with randomly generated subject data\", \"command-line\": \"populate_subjects --project #PROJECT# --n #NUM_SUBJECTS#\", \"outputs\": [], \"image\": \"somnonetz/snet-populate:latest\", \"container-labels\": {}, \"override-entrypoint\": true, \"label\": \"Populate Subjects\", \"network\": \"snet-apps\", \"version\": \"1.5\", \"schema-version\": \"1.0\", \"xnat\": [{\"description\": \"Populate a project with randomly generated subject data\", \"contexts\": [\"xnat:projectData\"], \"label\": \"Populate Subjects\", \"output-handlers\": [], \"external-inputs\": [{\"provides-value-for-command-input\": \"project\", \"name\": \"project\", \"default-value\": null, \"sensitive\": null, \"matcher\": null, \"required\": true, \"provides-files-for-command-mount\": null, \"replacement-key\": null, \"via-setup-command\": null, \"user-settable\": null, \"load-children\": false, \"type\": \"Project\", \"description\": \"Input project\"}], \"name\": \"populate-subjects\"}], \"mounts\": [], \"environment-variables\": {}, \"type\": \"docker\", \"ports\": {}, \"name\": \"populate-subjects\"}]"
