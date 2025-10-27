FROM golang:1.25-bookworm
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# renovate: datasource=github-releases depName=gohugoio/hugo
ARG HUGO_VERSION=v0.152.2
# renovate: datasource=github-releases depName=sass/dart-sass
ARG DART_SASS_VERSION=1.93.2

WORKDIR /tmp

# Install
#    Git     https://git-scm.com/
#    Make    https://www.gnu.org/software/make/
#    Node.js https://nodejs.org/
#    Task    https://taskfile.dev/
RUN curl -1sLf 'https://dl.cloudsmith.io/public/task/task/setup.deb.sh' | bash && \
    apt update && \
    apt install -y git make nodejs npm task && \
    apt clean

# Install Hugo Cli - https://gohugo.io/
COPY scripts/install_hugo.sh install_hugo.sh
RUN ./install_hugo.sh

# Install Dart: Sass - https://sass-lang.com/dart-sass/
COPY scripts/install-dart-sass.sh install-dart-sass.sh
RUN ./install-dart-sass.sh

# Install Post.Css - https://postcss.org/
RUN npm install --global postcss postcss-cli autoprefixer
