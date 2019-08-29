# nebula-docker

Docker containers for developers to build Nebula project sources.

- Fedora 21
- CentOS 7.5
- Ubuntu 18.04

## Usage

    $ docker pull xl4times/nebula-docker:ubuntu
    $ docker run --rm -ti \
          --security-opt seccomp=unconfined \
          -v /path/to/nebula/source:/home/nebula \
          --name nebula \
          xl4times/nebula-docker:ubuntu \
          bash
