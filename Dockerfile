FROM golang:1.23-bookworm
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# renovate: datasource=github-releases depName=gohugoio/hugo
ARG HUGO_VERSION=v0.136.5
# renovate: datasource=github-releases depName=sass/dart-sass
ARG DART_SASS_VERSION=1.80.4

WORKDIR /tmp

# Install Node.js
RUN apt update && \
    apt install -y nodejs npm  && \
    apt clean

# Install Hugo ClI
COPY scripts/install_hugo.sh install_hugo.sh
RUN ./install_hugo.sh

# Install Dart Sass
COPY scripts/install-dart-sass.sh install-dart-sass.sh
RUN ./install-dart-sass.sh
