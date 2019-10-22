# Nebula Graph Development Docker Image

Use `docker` to build [*Nebula*](https://github.com/vesoft-inc/nebula) project.

At this moment, we have provided following docker images for developers:

- `vesoft/nebula-dev:centos6`
- `vesoft/nebula-dev:centos7` // latest
- `vesoft/nebula-dev:ubuntu16`
- `vesoft/nebula-dev:ubuntu18`

## Usage

At first, you should install `docker` in your machine and then pull the [`vesoft/nebula-dev`](https://hub.docker.com/r/vesoft/nebula-dev) image from docker hub.
After that you can use following commands to build `Nebula` sources.

    $ docker pull vesoft/nebula-dev
    $ ./build.sh /path/to/nebula/root/directory
