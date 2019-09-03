FROM fedora:29

LABEL maintainer="yee.yi@vesoft.com"

RUN yum update -y && yum -y install vim wget \
    git \
    git-lfs \
    autoconf \
    autoconf-archive \
    automake \
    flex \
    libtool \
    cmake \
    make \
    bison \
    bzip2-devel \
    unzip \
    boost \
    boost-devel \
    boost-static \
    gperf \
    gcc \
    gcc-c++ \
    openssl \
    openssl-devel \
    libunwind-devel \
    lz4-devel \
    xz-devel \
    krb5-devel \
    ncurses-devel \
    readline-devel \
    perl \
    perl-WWW-Curl \
    libstdc++-static \
    maven \
    file \
    python \
    java-1.8.0-openjdk \
  && yum clean all \
  && rm -rf /var/cache/yum

RUN mkdir -p /home/nebula \
  && git clone https://github.com/yixinglu/nebula-3rdparty.git /home/nebula/nebula-3rdparty \
  && cd /home/nebula/nebula-3rdparty \
  && cmake -DSKIP_JAVA_JAR=ON . \
  && make && make install \
  && cd /home/nebula \
  && rm -rf /home/nebula/*

  # && cd third-party/fbthrift/thrift/lib/java/thrift \
  # && mvn compile install \

WORKDIR /home/nebula
