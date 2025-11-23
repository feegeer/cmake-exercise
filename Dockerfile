FROM ubuntu:24.04

WORKDIR /cmake-exercise

ADD . /cmake-exercise

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y build-essential cmake nano wget unzip libboost-all-dev libdeal.ii-dev
RUN wget -O /tmp/yaml-cpp.zip https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip \
    && unzip /tmp/yaml-cpp.zip -d /tmp/yaml-cpp \
    && mkdir  /tmp/yaml-cpp/build \
    && cd /tmp/yaml-cpp/build \
    && cmake /tmp/yaml-cpp/yaml-cpp-yaml-cpp-0.6.3 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local \
    && make install

CMD ["/bin/bash"]
