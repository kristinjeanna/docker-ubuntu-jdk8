#!/bin/sh

label=docker/ubuntu-jdk8:latest
found=$(docker images | grep -v REPOSITORY | awk '{print $1 ":" $2}' | grep --color=no "${label}")

if [[ -n "${found}" ]]; then
    docker rmi ${label}
fi

docker build \
    --no-cache \
    -t ${label} \
    -f Dockerfile \
    .
