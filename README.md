# nebula-docker

Use [docker](https://cloud.docker.com/repository/docker/xl4times/nebula-docker) to build Nebula project sources. 

We provide following three different OS containers for developer:

- Fedora 30
- CentOS 7.5.1804
- Ubuntu 18.04

## Usage

At first, you should install `docker` in your machine and pull the nebula dev image with selected tag.

    $ docker pull xl4times/nebula-dev:ubuntu
    $ build.sh /path/to/nebula/
