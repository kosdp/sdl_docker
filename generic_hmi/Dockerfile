FROM python:slim
WORKDIR /opt/sdl/generic_hmi
RUN apt-get update && apt-get install -yq --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/* \
    && git clone https://github.com/smartdevicelink/generic_hmi.git . \
    && sed -i 's/127\.0\.0\.1\:/sdl_core\:/g'  `find -name Flags.js`
CMD python -m http.server 3000
EXPOSE 3000
