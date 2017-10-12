# build ontop of official Java image
FROM openjdk:8-jdk-alpine
MAINTAINER Jan Mares <jan.mares@dtforce.com>
ARG GRADLE_VERSION=3.2.1

RUN apk update && \
    apk add docker bash

WORKDIR /usr/bin

RUN apk add --no-cache unzip curl && \
  curl -sLO https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip && \
  unzip gradle-${GRADLE_VERSION}-all.zip && \
  ln -s gradle-${GRADLE_VERSION} gradle && \
  rm gradle-${GRADLE_VERSION}-all.zip

ENV GRADLE_HOME /usr/bin/gradle
ENV PATH $PATH:$GRADLE_HOME/bin

RUN mkdir /app
WORKDIR /app
