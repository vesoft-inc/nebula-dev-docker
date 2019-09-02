FROM fedora:30

LABEL maintainer="yee.yi@vesoft.com"

RUN yum update -y && yum -y install vim wget \
  git \
  git-lfs \
  autoconf \
  automake \
  libtool \
  cmake \
  make \
  bison \
  unzip \
  boost \
  gperf \
  gcc-c++ \
  krb5-libs \
  openssl \
  libunwind \
  ncurses \
  readline \
  maven \
  java-1.8.0-openjdk \
  && yum clean all \
  && rm -rf /var/cache/yum

RUN mkdir -p /home/nebula && cd /home/nebula \
  && wget https://wsg-static.oss-cn-hangzhou.aliyuncs.com/others/nebula-3rdparty.tar.gz -O nebula-3rdparty.tar.gz \
  && tar zxf nebula-3rdparty.tar.gz \
  && cd nebula-3rdparty \
  && rm -rf CMakeCache.txt \
  && cmake -DSKIP_JAVA_JAR=OFF . \
  && make && make install \
  && cd third-party/fbthrift/thrift/lib/java/thrift \
  && mvn compile install \
  && cd /home/nebula \
  && rm -rf /home/nebula/*

WORKDIR /home/nebula
