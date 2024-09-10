#!/usr/bin/env bash

ARCH=$(uname -m)

if [[ "$ARCH" == "x86_64" ]]
then
    ARCH="x64"
fi

wget -O dart-sass.tar.gz https://github.com/sass/dart-sass/releases/download/${DART_SASS_VERSION}/dart-sass-${DART_SASS_VERSION}-linux-${ARCH}.tar.gz

tar -xzvf dart-sass.tar.gz

rm -rf dart-sass.tar.gz

mv dart-sass/* /usr/bin

chmod +x /usr/bin/sass

rm -rf dart-sass
