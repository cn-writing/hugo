#!/usr/bin/env bash

HUGO_VERSION_NO_PREFIX=${HUGO_VERSION:1}

ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]
then
    ARCH="amd64"
fi

wget -O hugo.deb https://github.com/gohugoio/hugo/releases/download/${HUGO_VERSION}/hugo_extended_${HUGO_VERSION_NO_PREFIX}_linux-${ARCH}.deb

dpkg --install hugo.deb

rm -rf hugo.deb
