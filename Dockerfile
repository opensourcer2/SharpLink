FROM ubuntu:18.04
LABEL Description="This image is used to build ToxTunnel for Linux" Vendor="n/a" Version="0.0.0"

WORKDIR /tmp
RUN mkdir /tmp/toxtunnel
ENV DEBIAN_FRONTEND=noninteractive

# Add dependencies for SharpLink build
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git \
    mono-complete \
    nuget

# Add dependencies for toxcore
RUN apt-get install -y \
    autoconf \
    automake \
    libconfig-dev \
    libsodium-dev \
    build-essential \
    checkinstall \
    devscripts \
    lintian \
    dh-make \
    check \
    autotools-dev \
    libtool \
    libc-dev \
    make \
    pkg-config \
    yasm

# Clean up to reduce image size
RUN apt-get clean && \
    rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/*

RUN git clone https://github.com/TokTok/c-toxcore.git && \
    cd c-toxcore && git checkout tags/v0.1.11 && \
    autoreconf -i && \
    ./configure --disable-av --enable-daemon && \
    make && \
    make install

ENTRYPOINT ["/tmp/toxtunnel/build_toxtunnel.sh"]
