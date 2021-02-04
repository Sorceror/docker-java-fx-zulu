FROM maven:3.6.3-jdk-8

RUN apt-get update \
    && apt-get upgrade -y \
    && mkdir -p /usr/share/man/man1 \
    && apt-get install -y --no-install-recommends \
        software-properties-common \
        wget \
        gnupg \
        curl \
        ca-certificates \
        bzip2 \
        zip \
        unzip \
        git \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL -o /tmp/zulu8.50.0.21-ca-fx-jdk8.0.272-linux_x64.tar.gz https://cdn.azul.com/zulu/bin/zulu8.50.0.21-ca-fx-jdk8.0.272-linux_x64.tar.gz \
  && cd /tmp/ \
  && tar -xf /tmp/zulu8.50.0.21-ca-fx-jdk8.0.272-linux_x64.tar.gz \
  && rm -f /tmp/zulu8.50.0.21-ca-fx-jdk8.0.272-linux_x64.tar.gz

ENV JAVA_HOME=/tmp/zulu8.50.0.21-ca-fx-jdk8.0.272-linux_x64/
RUN export JAVA_HOME