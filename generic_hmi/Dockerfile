FROM nginx:stable

WORKDIR /var/www

RUN apt-get update && apt-get install -yq --no-install-recommends git ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && git clone https://github.com/smartdevicelink/generic_hmi.git . \
    && sed -i 's/127\.0\.0\.1\:/sdl_core\:/g'  `find -name Flags.js` \
    && rm /etc/nginx/nginx.conf \
    && rm -r /etc/nginx/conf.d/*

COPY nginx.conf /etc/nginx/

EXPOSE 3000
