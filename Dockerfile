FROM golang:1.22-bookworm
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# renovate: datasource=github-releases depName=gohugoio/hugo
ARG HUGO_VERSION=v0.125.6
# renovate: datasource=github-releases depName=sass/dart-sass
ARG DART_SAAS_VERSION=1.76.0

WORKDIR /tmp

# Install Node.js
RUN apt update && \
    apt install -y nodejs npm  && \
    apt clean

# Install Hugo ClI
COPY scripts/install_hugo.sh install_hugo.sh
RUN ./install_hugo.sh

# Install Dart Sass
RUN wget -O dart-saas.tar.gz https://github.com/sass/dart-sass/releases/download/${DART_SAAS_VERSION}/dart-sass-${DART_SAAS_VERSION}-linux-x64.tar.gz && \
    tar -xzvf dart-saas.tar.gz && \
    rm -rf dart-saas.tar.gz && \
    mv dart-sass/sass /usr/local/bin && \
    chmod +x /usr/local/bin/sass && \
    rm -rf dart-saas
