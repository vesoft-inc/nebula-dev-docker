FROM fedora:29

LABEL maintainer="yee.yi@vesoft.com"

RUN yum update -y && yum -y install \
    autoconf \
    autoconf-archive \
    automake \
    bison \
    boost \
    boost-devel \
    boost-static \
    bzip2-devel \
    cmake \
    clang \
    clang-tools-extra \
    curl \
    file \
    flex \
    gcc \
    gcc-c++ \
    gdb \
    git \
    gperf \
    hostname \
    java-1.8.0-openjdk \
    java-1.8.0-openjdk-devel \
    krb5-devel \
    libstdc++-static \
    libstdc++-devel \
    libunwind \
    libunwind-devel \
    libtool \
    make \
    maven \
    ncurses \
    ncurses-devel \
    openssl \
    openssl-devel \
    perl \
    perl-WWW-Curl \
    python \
    readline \
    readline-devel \
    unzip \
    vim \
    wget \
    xz-devel \
  && yum clean all \
  && rm -rf /var/cache/yum

RUN mkdir -p /home/nebula \
  && git clone --depth 1 --single-branch --branch master https://github.com/vesoft-inc/nebula-3rdparty.git /home/nebula/nebula-3rdparty \
  && cd /home/nebula/nebula-3rdparty \
  && cmake -DSKIP_JAVA_JAR=ON . \
  && make -j $(nproc) && make install \
  && cd /home/nebula \
  && rm -rf /home/nebula/*

  # TODO(yee): Upgrade thrift refer to https://github.com/facebook/fbthrift/commit/fc37c6ab226e9a18c23ac682ceda8c427631b64e
  # && cd third-party/fbthrift/thrift/lib/java/thrift \
  # && mvn compile install \

WORKDIR /home/nebula
