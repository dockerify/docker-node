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
