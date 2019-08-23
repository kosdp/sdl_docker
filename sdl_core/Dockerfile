FROM ubuntu:18.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    sudo \
    git \
    ca-certificates \
    cmake \
    build-essential \
    libavahi-client-dev \
    libsqlite3-dev \
    #chromium-browser \
    libssl1.0-dev \
    libudev-dev \
    libgtest-dev \
    libbluetooth3 \
    libbluetooth-dev \
    bluez-tools \
    libpulse-dev \
    libusb-1.0-0-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/sdl \
    && cd /opt/sdl \
    && git clone https://github.com/smartdevicelink/sdl_core.git

COPY ./sdl_preloaded_pt.json /opt/sdl/sdl_core/src/appMain/

RUN mkdir -p /opt/sdl/build \
    && cd /opt/sdl/build \
    && cmake /opt/sdl/sdl_core \
    && make \
    && make install \
    && make clean \
    && mv /opt/sdl/build/bin /opt/sdl \
    && rm -r /opt/sdl/sdl_core \
    && rm -r /opt/sdl/build \
    && ldconfig

WORKDIR /opt/sdl/bin

EXPOSE 3001 8080 8087 12345

CMD /opt/sdl/bin/start.sh
