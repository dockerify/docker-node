FROM ubuntu:16.04

RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git-core \
    jq \
    ntp \
    unzip \
    zip \
    sudo \
    bash \
    ca-certificates && \
    apt-get clean
     
# download and install gosu
RUN curl -o gosu -sSL https://github.com/tianon/gosu/releases/download/1.10/gosu-$(dpkg --print-architecture | awk -F- '{ print $NF }')
RUN sudo mv gosu /usr/local/bin/
RUN sudo chmod +x /usr/local/bin/gosu

# download and install nodejs
ENV NODE_VERSION 6.x
RUN curl -sSL https://deb.nodesource.com/setup_"$NODE_VERSION" | gosu bash - && \
    apt-get install nodejs -y && \
    apt-get clean
RUN npm install -g npm bower
     
# To install, run the following command as root:
ENV DOCKER_VERSION 1.13.1
RUN curl -sSLO https://get.docker.com/builds/Linux/x86_64/docker-"$DOCKER_VERSION".tgz && \
    gosu tar --strip-components=1 -xvzf docker-"$DOCKER_VERSION".tgz -C /
RUN gosu tar -xvzf docker-"$DOCKER_VERSION".tgz
RUN gosu mv docker/* /usr/local/bin/

# RUN gosu /usr/local/bin/docker daemon
RUN gosu docker --help
