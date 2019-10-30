# build ontop of official Java image
FROM gradle:5.4-jdk11-slim
USER root

ENV \
    BUILD_DEPS="apt-transport-https gnupg2 software-properties-common"  \
    RUNTIME_DEPS="tar docker unzip curl git openssh-client ca-certificates docker-compose gettext-base"

RUN \
    apt-get update && \
    apt-get install -y $BUILD_DEPS &&  \
    apt-get install -y $RUNTIME_DEPS && \
    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
    apt-get remove -y $BUILD_DEPS && \
    apt-get clean

RUN mkdir /app
WORKDIR /app

