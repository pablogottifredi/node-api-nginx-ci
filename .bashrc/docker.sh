#!/bin/bash
PACKAGE_VERSION=$(sed -nE 's/^\s*"version": "(.*?)",$/\1/p' package.json)
BUILD_NO=$(git log -1 --pretty=%h)
VERSION="${PACKAGE_VERSION}.${BUILD_NO}"
NAME="base-api-node/api"
IMG="${NAME}:${VERSION}"
LATEST="$NAME:latest"
echo "Building ${IMG}" 
# build the docker image
docker build -f Dockerfile -t $IMG .

# list all docker images
docker images

# run the docker image
docker run -p 8080:3000 -d $IMG

# wait for app to start
sleep 5

# test
curl -i http://localhost:8080

# open in browser
open http://localhost:8080
