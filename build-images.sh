#! /usr/bin/env bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build --pull $BASEDIR -f $BASEDIR/build-ubuntu.Dockerfile -t vesoft/nebula-dev:ubuntu
docker build --pull $BASEDIR -f $BASEDIR/build-centos.Dockerfile -t vesoft/nebula-dev:centos
docker build --pull $BASEDIR -f $BASEDIR/Dockerfile -t vesoft/nebula-dev
