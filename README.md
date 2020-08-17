# Nebula Graph Development Docker Image

Use `docker` to build [*Nebula*](https://github.com/vesoft-inc/nebula) project.

At this moment, we have provided following docker images for developers:

- `vesoft/nebula-dev:centos6`
- `vesoft/nebula-dev:centos7`
- `vesoft/nebula-dev:ubuntu1604`
- `vesoft/nebula-dev:ubuntu1804`

And the `vesoft/nebula-dev:centos7` image is also tagged as `vesoft/nebula-dev:latest`.

## Usage

At first, you should install `docker` in your machine and then pull the [`vesoft/nebula-dev`](https://hub.docker.com/r/vesoft/nebula-dev) image from docker hub.
After that you can use following commands to build `Nebula` sources.

    $ docker pull vesoft/nebula-dev:ubuntu1804
    $ curl -fsSL https://raw.githubusercontent.com/vesoft-inc/nebula-dev-docker/master/run.sh -o run.sh
    $ chmod +x run.sh
    $ ./run.sh /path/to/nebula/directory ubuntu1804
