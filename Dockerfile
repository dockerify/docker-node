ENV UBUNTU_VERSION 16.04
ENV DOCKER_VERSION 1.13.1
ENV NODE_VERSION 6.x

FROM ubuntu:16.04

RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git-core \
    jq \
    ntp \
    unzip \
    zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
     
# download and install gosu
RUN curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.10/gosu-$(dpkg --print-architecture)" && \
    chmod +x /usr/local/bin/gosu

# download and install nodejs
RUN curl -sSL https://deb.nodesource.com/setup_"$NODE_VERSION" | gosu bash - && \
    apt-get install -y --no-install-recommends nodejs

RUN npm install -g npm bower
     
# To install, run the following command as root:
RUN curl -sSLO https://get.docker.com/builds/Linux/x86_64/docker-"$DOCKER_VERSION".tgz && \
    gosu tar --strip-components=1 -xvzf docker-"$DOCKER_VERSION".tgz -C /

RUN gosu tar -xvzf docker-"$DOCKER_VERSION".tgz
RUN gosu mv docker/* /usr/local/bin/

# RUN gosu /usr/local/bin/docker daemon
RUN gosu docker --help
