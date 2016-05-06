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
     xvfb \
     qt5-default \
     libqt5webkit5-dev \
     libmysqlclient-dev \
     jq \
     sudo \
     && apt-get clean
