#!/bin/bash
PACKAGE_VERSION=$(sed -nE 's/^\s*"version": "(.*?)",$/\1/p' package.json)
BUILD_NO=$(git log -1 --pretty=%h)
VERSION="${PACKAGE_VERSION}.${BUILD_NO}"
NAME="base-api-node/api"
NAMETAG="${NAME}:${VERSION}"

truncate -s 0 .env
echo "API_NAME="$NAME >> .env
echo "API_VERSION="$VERSION >> .env
echo "API_NAME_TAG="$NAMETAG >> .env


echo 'base-api-node.local localhost' >> ~/.hosts
echo 'base-api-node.local localhost' >> /etc/hosts

echo 'export HOSTALIASES=~/.hosts' >> ~/.bashrc
