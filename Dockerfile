FROM ubuntu:latest@sha256:e348fbbea0e0a0e73ab0370de151e7800684445c509d46195aef73e090a49bd6

RUN apt-get update && apt-get -y upgrade && \
     apt-get install -y \
     build-essential \
     curl \
     git-core \
     jq \
     ntp \
     unzip \
     wget \
     zip \
     sudo && \
     apt-get clean
     
# download and install nodejs
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo bash - && \
     apt-get install nodejs -y && \
     apt-get clean
RUN npm install -g npm bower
     
# To install, run the following command as root:
ARG DOCKER_VERSION=1.13.1
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz && \
     sudo tar --strip-components=1 -xvzf docker-${DOCKER_VERSION}.tgz -C /
RUN sudo tar -xvzf docker-${DOCKER_VERSION}.tgz
RUN sudo mv docker/* /usr/local/bin/

# RUN sudo /usr/local/bin/docker daemon
RUN sudo docker --help
