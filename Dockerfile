FROM gradle:8.10.2-jdk17-alpine
USER root
    # BUILD_DEPS="apt-transport-https gnupg2 software-properties-common"  \
    # RUNTIME_DEPS="tar docker unzip curl git openssh-client ca-certificates docker-compose gettext-base"

ENV \
    BUILD_DEPS="gettext"  \
    RUNTIME_DEPS="libintl docker-cli python3 py3-pip docker-compose tar unzip curl git openssh-client ca-certificates graphviz"

RUN set -x && \
    apk add --update $RUNTIME_DEPS && \
    apk add --update --virtual build_deps $BUILD_DEPS &&  \
    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
    apk del build_deps

RUN mkdir /app
WORKDIR /app

