FROM node

RUN apt-get update && apt-get -y upgrade && \
     apt-get install -y \
     build-essential \
     curl \
     git-core \
     ntp \
     wget \
     zip \
     unzip \
     jq \
     sudo \
     && apt-get clean

RUN wget -O /bin/docker https://get.docker.com/builds/Linux/x86_64/docker-1.6.0
RUN chmod +x /bin/docker
