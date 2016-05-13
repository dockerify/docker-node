FROM ubuntu

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

# To install, run the following command as root:
RUN curl -sSL -O https://get.docker.com/builds/Linux/x86_64/docker-1.11.1.tgz \
RUN sudo tar zxf docker-1.11.1.tgz -C .
RUN sudo mv docker/* /usr/local/bin/
RUN sudo docker -d
RUN sudo status docker
RUN sudo restart docker
