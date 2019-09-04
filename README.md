# Nebula Graph Development Docker Image

Use `docker` to build *Nebula* project sources. 

At this moment, we only provide `fedora:29` docker image for developers:

## Usage

At first, you should install `docker` in your machine and then pull the `vesoft/nebula-dev` image from [docker hub](https://cloud.docker.com/repository/docker/vesoft/nebula-dev). After that you can use
Following commands to build `Nebula` sources.

    $ docker pull vesoft/nebula-dev
    $ build.sh /path/to/nebula/project/sources
