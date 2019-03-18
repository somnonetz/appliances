FROM docker.io/somnonetz/mcr:2015a

RUN apt-get update \
&& apt-get install -y git python3-pip python3-venv libffi-dev libssl-dev python3-dev \
&& useradd -ms /bin/bash cc

# switch user
USER cc

# install connectors
ENV PATH /home/cc/.local/bin:${PATH}

RUN python3 -m venv /home/cc/.local/red \
&& . /home/cc/.local/red/bin/activate \
&& pip install wheel \
&& pip install red-connector-http==0.3 red-connector-ssh==0.5 red-connector-xnat==0.9 \
&& mkdir -p /home/cc/.local/bin \
&& ln -s /home/cc/.local/red/bin/red-connector-* /home/cc/.local/bin

# install app
RUN mkdir -p /home/cc/.local/bin \
&& cd /home/cc/.local/bin \
&& curl -OL https://github.com/somnonetz/physiological-networks-tds/releases/download/tds2csv-1.0/run_pn_tds_biosignals2csv.sh \
&& curl -OL https://github.com/somnonetz/physiological-networks-tds/releases/download/tds2csv-1.0/pn_tds_biosignals2csv \
&& chmod +x *pn_tds_biosignals2csv*

ADD --chown=cc:cc pn-tds-biosignals2csv-wrapper /home/cc/.local/bin/pn-tds-biosignals2csv-wrapper
