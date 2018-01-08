FROM alpine:latest
LABEL maintainer "dutradda@gmail.com"

RUN apk add --update \
    libshout-dev libxml2-dev libvorbis-dev check-dev \
    g++ make autoconf automake gettext-dev libtool \
    taglib-dev bsd-compat-headers file  \
    libshout libxml2 libvorbis check gettext taglib && \
    wget https://github.com/xiph/ezstream/archive/develop.tar.gz && \
    tar -zxf develop.tar.gz && \
    cd ezstream-develop && \
    ./autogen.sh && \
    ./configure --prefix=/usr && \
    make && make install && \
    apk del libshout-dev libxml2-dev libvorbis-dev check-dev \
    g++ make autoconf automake gettext-dev libtool \
    bsd-compat-headers taglib-dev file && \
    rm -rf /var/cache/apk/*

CMD ezstream -c /ezstream/config.xml
