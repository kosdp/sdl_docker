FROM deb_str_base:latest

WORKDIR /opt/sdl_core

RUN apt-get update && apt-get install sudo \ 
    wget \
    apt-transport-https \
    gnupg2 \
    git \
    software-properties-common -y \
    && wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \ 
    && apt-add-repository "deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-6.0 main" \
    && apt update && apt install -yq \
    automake \
    cmake \
    cmake-curses-gui \
    ccache \
    clang-format-6.0 \
    g++ \
    gdb \
    lcov \
    html2text \
    cppcheck \
    libexpat1-dev \
    libssl1.0-dev \
    libbluetooth3 \
    libbluetooth-dev \
    libudev-dev \
    libusb-1.0 \
    bluez-tools \
    sqlite3 \
    libsqlite3-dev \
    build-essential \
    python-dev \
    autotools-dev \
    libicu-dev \
    libbz2-dev \
    clang \  
    libbluetooth-dev \ 
    libusb-1.0-0-dev \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
