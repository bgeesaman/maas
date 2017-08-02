#!/usr/bin/env bash

IMAGE_VERSION=v0.0.1
IMAGE_REPO=maas

# Build and tag latest
docker build --rm=true -t ${IMAGE_REPO}:${IMAGE_VERSION} .
docker tag ${IMAGE_REPO}:${IMAGE_VERSION} ${IMAGE_REPO}:${IMAGE_VERSION}
docker run --rm --cap-add=NET_ADMIN --net=host ${IMAGE_REPO}:${IMAGE_VERSION} -d -q
