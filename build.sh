#!/bin/sh

docker run --rm -ti \
  --security-opt seccomp=unconfined \
  -v "$1":/home/nebula \
  --name nebula \
  xl4times/nebula-docker:ubuntu \
  bash
