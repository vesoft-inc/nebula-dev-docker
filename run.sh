#!/usr/bin/env bash

TAG=${2:-latest}

docker run --rm -ti \
  --security-opt seccomp=unconfined \
  -v "$1":/home/nebula \
  --name nebula_$USER \
  vesoft/nebula-dev:$TAG \
  bash
