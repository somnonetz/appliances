FROM docker.io/debian:9.6-slim

RUN apt-get update \
&& apt-get install -y curl unzip libxt6 libncurses5 libxext6 \
&& mkdir /mcr-install \
&& curl -L https://www.mathworks.com/supportfiles/downloads/R2015a/deployment_files/R2015a/installers/glnxa64/MCR_R2015a_glnxa64_installer.zip > /mcr-install/installer.zip \
&& unzip /mcr-install/installer.zip -d /mcr-install \
&& /mcr-install/install -agreeToLicense yes -mode silent \
&& rm -r /mcr-install

ENV MCR_ROOT /usr/local/MATLAB/MATLAB_Runtime/v85
