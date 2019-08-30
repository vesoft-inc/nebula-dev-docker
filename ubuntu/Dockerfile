FROM ubuntu:18.04

LABEL maintainer="yee.yi@vesoft.com"

COPY ./sources.list.d/aliyun.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y locales \
  wget \
  git \
  git-lfs \
  gcc-multilib \
  libtool \
  autoconf \
  autoconf-archive \
  automake \
  make \
  python \
  maven \
  openjdk-8-jdk \
  && update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java  \
  && rm -rf /var/lib/apt/lists/* \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN wget https://nebula-graph.oss-cn-hangzhou.aliyuncs.com/build-deb/ubuntu1804.tar.gz \
  && tar xf ubuntu1804.tar.gz \
  && adduser --system --group --home /home/engshare engshare \
  && chmod -R 755 /home/engshare \
  && dpkg -i ubuntu1804/*.deb \
  && wget http://ftp.gnu.org/gnu/bison/bison-3.0.5.tar.gz \
  && tar xf bison-3.0.5.tar.gz \
  && cd bison-3.0.5 && ./configure && make && make install && cd .. \
  && rm -rf ubuntu1804* bison-* 

RUN alias ctest='/home/engshare/cmake/bin/ctest' \
  && alias cmake='/home/engshare/cmake/bin/cmake -DCMAKE_C_COMPILER=/home/engshare/gcc/bin/gcc -DCMAKE_CXX_COMPILER=/home/engshare/gcc/bin/g++ -DNEBULA_GPERF_BIN_DIR=/home/engshare/gperf/bin -DNEBULA_FLEX_ROOT=/home/engshare/flex -DNEBULA_BOOST_ROOT=/home/engshare/boost -DNEBULA_OPENSSL_ROOT=/home/engshare/openssl -DNEBULA_KRB5_ROOT=/home/engshare/krb5 -DNEBULA_LIBUNWIND_ROOT=/home/engshare/libunwind -DNEBULA_READLINE_ROOT=/home/engshare/readline -DNEBULA_NCURSES_ROOT=/home/engshare/ncurses' \
  && export LIBRARY_PATH='/usr/lib/x86_64-linux-gnu:$LIBRARY_PATH'

RUN mkdir -p /home/nebula && cd /home/nebula \
  && git lfs install \
  && git clone https://github.com/vesoft-inc/nebula-3rdparty.git \
  && cd nebula-3rdparty \
  && cmake && make && make install \
  && cd .. && rm -rf nebula-3rdparty

WORKDIR /home/nebula

