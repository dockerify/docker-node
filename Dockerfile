FROM ubuntu

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
     
# To install, run the following command as root:
RUN curl -sSL -O https://get.docker.com/builds/Linux/x86_64/docker-1.11.1.tgz && sudo tar zxf docker-1.11.1.tgz -C /
RUN sudo tar zxf docker-1.11.1.tgz
RUN sudo mv docker/* /usr/local/bin/

# RUN sudo /usr/local/bin/docker daemon
RUN sudo docker --help
