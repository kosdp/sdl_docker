FROM ubuntu:18.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    sudo \
    git \
    ca-certificates \
    liblua5.2-dev \
    libxml2-dev \
    lua-lpeg-dev \
    openssl1.0-dev \
    build-essential \
    qt5-default \
    qt5-qmake \
    libqt5websockets5-dev \
    net-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/sdl/sdl_atf

ENV QMAKE=/usr/bin/qmake

RUN git clone https://github.com/smartdevicelink/sdl_atf.git . \
    && git submodule init \
    && git submodule update \
    && make \
    && git clone https://github.com/smartdevicelink/sdl_atf_test_scripts.git /opt/sdl/sdl_atf_test_scripts \
    && cp -r /opt/sdl/sdl_atf_test_scripts/* ./ \
    && rm -r /opt/sdl/sdl_atf_test_scripts

COPY config.lua /opt/sdl/sdl_atf/modules

CMD /opt/sdl/sdl_atf/start.sh
