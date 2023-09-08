#!/usr/bin/env bash

HUGO_VERSION_NO_PREFIX=${HUGO_VERSION:1}

wget -O hugo.deb https://github.com/gohugoio/hugo/releases/download/${HUGO_VERSION}/hugo_extended_${HUGO_VERSION_NO_PREFIX}_linux-amd64.deb

dpkg --install hugo.deb

rm -rf hugo.deb
