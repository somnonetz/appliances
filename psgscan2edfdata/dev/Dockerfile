FROM docker.io/somnonetz/mcr:2018b

RUN apt-get update \
&& apt-get install -y git python3-pip python3-venv libffi-dev libssl-dev python3-dev \
&& useradd -ms /bin/bash cc

# switch user
USER cc

RUN  mkdir -p /home/cc/.local/bin

ENV PATH /home/cc/.local/bin:${PATH}

# install connectors
RUN python3 -m venv /home/cc/.local/red \
&& . /home/cc/.local/red/bin/activate \
&& pip install wheel \
&& pip install red-connector-http==0.3 red-connector-ssh==0.5 red-connector-xnat==0.9 \
&& ln -s /home/cc/.local/red/bin/red-connector-* /home/cc/.local/bin

# install app
RUN mkdir -p /home/cc/.local/bin \
&& mkdir /home/cc/.config \
&& cd /home/cc/.local/bin \
&& curl -fOL https://github.com/somnonetz/psgScan2edfData/releases/download/v1.3.1/run_sn_edfScan2edfData.sh \
&& curl -fOL https://github.com/somnonetz/psgScan2edfData/releases/download/v1.3.1/sn_edfScan2edfData \
&& chmod +x *sn_edfScan2edfData* \
&& cd /home/cc/.config \
&& curl -fOL https://github.com/somnonetz/psgScan2edfData/releases/download/1.2.0/psg_channelmap.txt
