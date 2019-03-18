FROM docker.io/tensorflow/tensorflow:1.9.0-gpu-py3

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
ENV PYTHONPATH=/home/cc/.local/lib/python3.5/site-packages/:/home/cc/narco:/usr/local/lib/python3.5/dist-packages

RUN pip3 install --user pyedflib==0.1.13 gpflow==1.2.0 pywavelets==1.0.1 samplerate==0.1.0 \
&& mkdir -p ~/.config/matplotlib && echo "backend: agg" > ~/.config/matplotlib/matplotlibrc \
&& curl -L https://github.com/Stanford-STAGES/stanford-stages/archive/b23bf2501f5a97e2638e56fae04906da8da5a9d6.zip \
> /home/cc/app.zip \
&& curl -L https://www.informaton.org/narco/ml/ac.zip > /home/cc/ac.zip \
&& curl -L https://www.informaton.org/narco/ml/gp.zip > /home/cc/gp.zip \
&& curl -L https://www.informaton.org/narco/ml/scaling.zip > /home/cc/scaling.zip \
&& unzip /home/cc/app.zip -d /home/cc/app \
&& mv /home/cc/app/* /home/cc/narco \
&& rm -r /home/cc/app \
&& rm /home/cc/narco/ml/ac \
&& rm /home/cc/narco/ml/gp \
&& unzip /home/cc/ac.zip -d /home/cc/narco/ml \
&& unzip /home/cc/gp.zip -d /home/cc/narco/ml \
&& unzip -o /home/cc/scaling.zip -d /home/cc/narco/ml \
&& rm /home/cc/app.zip \
&& rm /home/cc/ac.zip \
&& rm /home/cc/gp.zip \
&& rm /home/cc/scaling.zip \
&& sed -i '/pdb.set_trace()/d' /home/cc/narco/*.py \
&& sed -i 's/\.\/ml\//\/home\/cc\/narco\/ml\//g' /home/cc/narco/*.py \
&& sed -i 's/# import gpflow as gpf/import gpflow as gpf/g' /home/cc/narco/inf_narco_app.py

ADD --chown=cc:cc ./hypnodensity /home/cc/.local/bin/hypnodensity
