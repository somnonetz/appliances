FROM docker.io/ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
&& apt-get install -y unzip make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget \
curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git \
&& useradd -ms /bin/bash cc

# switch user
USER cc

ENV PATH /home/cc/.local/bin:${PATH}

RUN mkdir -p /home/cc/.local/bin

# install python via pyenv
ENV PATH /home/cc/.pyenv/bin:/home/cc/.pyenv/shims:${PATH}

RUN curl https://pyenv.run | bash \
&& pyenv install 3.5.6 \
&& pyenv global 3.5.6

# install connectors
RUN pip install red-connector-http==0.3 red-connector-ssh==0.5 red-connector-xnat==0.9

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

RUN pip install tensorflow==1.13.1
RUN pip install pyedflib==0.1.13 gpflow==1.2.0 pywt==1.0.6 samplerate==0.1.0 scikit-image==0.14.2

#ENV PYTHONPATH=/home/cc/.local/lib/python3.6/site-packages

ADD --chown=cc:cc ./hypnodensity /home/cc/.local/bin/hypnodensity
