#!/bin/bash

TAG=${2:-latest}

docker run --rm -ti \
  --security-opt seccomp=unconfined \
  -v "$1":/home/nebula \
  --name nebula \
  vesoft/nebula-dev:$TAG \
  bash
