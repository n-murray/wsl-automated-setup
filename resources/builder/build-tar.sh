#!/bin/sh

#Update and install docker
apk add --update docker
dockerd > /dev/null 2>&1 &

#Build image, run and export as tarball 
docker build --build-arg USER=$1 -t dev-env -f resources/Dockerfile .
docker run --name dev-env dev-env
docker export --output='dev-env.tar.gz' dev-env