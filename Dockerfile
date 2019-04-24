FROM debian:9
LABEL Description="This image is used to build ToxTunnel for Linux" Vendor="n/a" Version="0.0.0"

WORKDIR /tmp/tox

RUN apt update && \
    apt install -y git mono-complete nuget

RUN git clone https://github.com/opensourcer2/SharpLink && \
    cd SharpLink && \
    nuget restore && \
    xbuild /p:Configuration="Debug POSIX" /p:PostBuildEvent=
