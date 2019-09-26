# Nebula Graph Development Docker Image

Use `docker` to build [*Nebula*](https://github.com/vesoft-inc/nebula) project.

At this moment, we only provide `fedora:29` and `centos:7` docker images for developers:

- `vesoft/nebula-dev:latest` // fedora:29
- `vesoft/nebula-dev:centos`

## Usage

At first, you should install `docker` in your machine and then pull the [`vesoft/nebula-dev`](https://hub.docker.com/r/vesoft/nebula-dev) image from docker hub.
After that you can use following commands to build `Nebula` sources.

    $ docker pull vesoft/nebula-dev
    $ ./build.sh /path/to/nebula/root/
