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

COPY ./sdl_preloaded_pt.json.new /opt/sdl/sdl_core/src/appMain/sdl_preloaded_pt.json

RUN mkdir -p /opt/sdl/build \
    && cd /opt/sdl/build \
    && sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /opt/sdl/sdl_core/src/appMain/smartDeviceLink.ini \
    && cmake /opt/sdl/sdl_core \
    && make \
    && make install \
    && make clean \
    && mv /opt/sdl/build/bin /opt/sdl \
    && cd /opt/sdl/bin \
    && rm -r /opt/sdl/sdl_core \
    && rm -r /opt/sdl/build \
    && ldconfig

WORKDIR /opt/sdl/bin

EXPOSE 3001 8087 8090 12345

CMD /opt/sdl/bin/start.sh
