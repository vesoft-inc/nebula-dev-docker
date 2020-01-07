ARG VERSION=6

FROM centos:${VERSION}

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN yum update -y && yum install -y centos-release-scl epel-release \
  && yum install -y \
    ccache \
    curl \
    gettext \
    git \
    glibc-headers \
    glibc-devel \
    m4 \
    make \
    ncurses-devel \
    readline-devel \
    redhat-lsb-core \
    rpm-build \
    sudo \
    unzip \
    vim \
    wget \
    xz \
    zlib-devel \
  && yum clean all \
  && rm -rf /var/cache/yum

WORKDIR /root

# Install cmake 3.15
RUN curl -fsSL https://github.com/Kitware/CMake/releases/download/v3.15.5/cmake-3.15.5-Linux-x86_64.tar.gz -O \
  && tar zxf cmake*.tar.gz -C /opt  \
  && rm -rf cmake*.tar.gz

ENV PATH=${PATH}:/opt/cmake-3.15.5-Linux-x86_64/bin:/opt/vesoft/toolset/gcc/7.5.0/bin
ENV CC=/opt/vesoft/toolset/gcc/7.5.0/bin/gcc
ENV CXX=/opt/vesoft/toolset/gcc/7.5.0/bin/g++

# Install nebula third-party dependencies
RUN git clone --depth 1 --branch master https://github.com/vesoft-inc/nebula.git \
  && ./nebula/third-party/install-gcc.sh \
  && ./nebula/third-party/install-third-party.sh \
  && rm -rf nebula
