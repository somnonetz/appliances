FROM docker.io/somnonetz/mcr:2015a

RUN apt-get update \
&& apt-get install -y git python3-pip python3-venv libffi-dev libssl-dev python3-dev \
&& useradd -ms /bin/bash cc

# switch user
USER cc

# install connectors
ENV PATH=/home/cc/.local/red/bin:${PATH}

RUN python3 -m venv /home/cc/.local/red \
&& . /home/cc/.local/red/bin/activate \
&& pip install wheel \
&& pip install red-connector-http==0.3 red-connector-ssh==0.5 red-connector-xnat==0.9

# install app
ENV PATH=/home/cc/.local/bin:${PATH}

RUN mkdir -p /home/cc/.local/bin \
&& curl -sSL https://github.com/somnonetz/physiological-networks-tds/releases/download/1.0.0/run_sn_TDS.sh > /home/cc/.local/bin/run_sn_TDS.sh \
&& curl -sSL https://github.com/somnonetz/physiological-networks-tds/releases/download/1.0.0/sn_TDS > /home/cc/.local/bin/sn_TDS \
&& chmod +x /home/cc/.local/bin/*sn_TDS*
