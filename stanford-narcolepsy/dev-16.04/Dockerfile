FROM docker.io/ubuntu:16.04

RUN apt-get update \
&& apt-get install -y unzip curl python3-pip python3-venv python3-dev libffi-dev libssl-dev \
&& useradd -ms /bin/bash cc

# switch user
USER cc

ENV PATH /home/cc/.local/bin:${PATH}

RUN mkdir -p /home/cc/.local/bin

# install connectors
RUN python3 -m venv /home/cc/.local/red \
&& . /home/cc/.local/red/bin/activate \
&& pip install wheel \
&& pip install red-connector-http==0.3 red-connector-ssh==0.5 red-connector-xnat==0.9 \
&& ln -s /home/cc/.local/red/bin/red-connector-* /home/cc/.local/bin

# install app
RUN curl -L https://github.com/Stanford-STAGES/stanford-stages/archive/81613b61c61d0f3b4586c87b6617b4d09d228d8a.zip > /home/cc/app.zip \
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
&& rm /home/cc/scaling.zip

RUN pip3 install --user tensorflow==1.13.1
RUN pip3 install --user pyedflib==0.1.13 gpflow==1.2.0 pywt==1.0.6 samplerate==0.1.0 scikit-image==0.14.2

ENV PYTHONPATH=/home/cc/.local/lib/python3.5/site-packages

ADD --chown=cc:cc ./hypnodensity /home/cc/.local/bin/hypnodensity
