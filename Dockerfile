# build ontop of official Java image
FROM openjdk:11-jdk-slim
MAINTAINER Jan Mares <jan.mares@dtforce.com>
ARG GRADLE_VERSION=5.0

ENV \
    BUILD_DEPS="apt-transport-https gnupg2 software-properties-common"  \
    RUNTIME_DEPS="gettext python-pip tar bash docker unzip curl git openssh-client ca-certificates docker.io"

RUN \
    apt-get update && \
    apt-get install -y $BUILD_DEPS &&  \
    apt-get install -y $RUNTIME_DEPS && \
    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
    apt-get remove -y $BUILD_DEPS && \
    apt-get clean

RUN pip install 'docker-compose==1.16.1'

WORKDIR /usr/bin

RUN \
  curl -sLO https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip && \
  unzip gradle-${GRADLE_VERSION}-all.zip && \
  ln -s gradle-${GRADLE_VERSION} gradle && \
  rm gradle-${GRADLE_VERSION}-all.zip

ENV GRADLE_HOME /usr/bin/gradle
ENV PATH $PATH:$GRADLE_HOME/bin

RUN mkdir /app
WORKDIR /app

