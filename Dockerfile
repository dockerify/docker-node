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

# RUN wget -O /bin/docker https://get.docker.com/builds/Linux/x86_64/docker-1.6.0
# RUN chmod +x /bin/docker

# To install, run the following command as root:
RUN curl -sSL -O https://get.docker.com/builds/Linux/x86_64/docker-1.11.1.tgz && sudo tar zxf docker-1.11.1.tgz -C / && sudo /usr/local/bin/docker daemon
