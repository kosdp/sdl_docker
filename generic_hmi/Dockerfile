FROM nginx:stable
WORKDIR /usr/share/nginx/html
RUN apt-get update && apt-get install -yq --no-install-recommends git ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && rm /usr/share/nginx/html/* \
    && git clone https://github.com/smartdevicelink/generic_hmi.git . \
    && sed -i 's/127\.0\.0\.1\:/sdl_core\:/g'  `find -name Flags.js`
