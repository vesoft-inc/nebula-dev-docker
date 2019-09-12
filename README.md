# Nebula Graph Development Docker Image

Use `docker` to build [*Nebula*](https://github.com/vesoft-inc/nebula) project.

At this moment, we only provide `fedora:29` docker image for developers:

## Usage

At first, you should install `docker` in your machine and then pull the [`vesoft/nebula-dev` image](https://hub.docker.com/r/vesoft/nebula-dev) from docker hub.
After that you can use following commands to build `Nebula` sources.

    $ docker pull vesoft/nebula-dev
    $ ./build.sh /path/to/nebula/root/
