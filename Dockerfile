FROM golang:1.21-bookworm
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# renovate: datasource=github-releases depName=gohugoio/hugo
ARG HUGO_VERSION=v0.118.2
# renovate: datasource=github-releases depName=sass/dart-sass
ARG DART_SAAS_VERSION=1.66.1

WORKDIR /tmp

# Install Node.js
RUN apt update && \
    apt install -y nodejs npm  && \
    apt clean

# Install Hugo CLI
RUN wget -O hugo.deb https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.deb && \
    dpkg --install hugo.deb && \
    rm -rf hugo.deb

# Install Dart Sass
RUN wget -O dart-saas.tar.gz https://github.com/sass/dart-sass/releases/download/${DART_SAAS_VERSION}/dart-sass-${DART_SAAS_VERSION}-linux-x64.tar.gz && \
    tar -xzvf dart-saas.tar.gz && \
    rm -rf dart-saas.tar.gz && \
    mv dart-sass/sass /usr/local/bin && \
    chmod +x /usr/local/bin/sass && \
    rm -rf dart-saas
