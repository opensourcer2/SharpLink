FROM debian:9
LABEL Description="This image is used to build ToxTunnel for Linux" Vendor="n/a" Version="0.0.0"

WORKDIR /tmp/tox

# Add dependencies for SharpLink build
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git \
    mono-complete \
    nuget

# Add dependencies for toxcore
RUN apt-get install -y && \
    autoconf \
    automake \
    libconfig-dev \
    libsodium-dev \
    build-essential \
    checkinstall \
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

RUN git clone https://github.com/opensourcer2/SharpLink && \
    cd SharpLink && \
    nuget restore && \
    xbuild /p:Configuration="Debug POSIX" /p:PostBuildEvent=
