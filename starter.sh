#!/bin/bash
#
##create local copy of the repositories:
#echo "Clonning repositories sdl_core & sdl_hmi"
#echo "  "
#
#set -e

mkdir -p ~/starter/git/sdl/
cd ~/starter/git/sdl/
git clone https://github.com/smartdevicelink/sdl_core.git

mkdir -p ~/starter/git/sdl/ 
cd ~/starter/git/sdl/
git clone https://github.com/smartdevicelink/sdl_hmi.git

#makind required modifications of the hmi config for working with the composer
sed -i 's/127\.0\.0\.1\:8087/sdl_core\:8087/g'  ~/starter/git/sdl/sdl_hmi/app/Flags.js

#creating base image
echo "Building SDL docker image" 
mkdir -p ~/starter/builds/sdl_core
tm=$(date --date="+35 minutes" +"%H:%M")
echo "ETA: $tm"
echo "  "

docker rm sdlcoreready
cd ~/starter/docker/debian/stretch/ && docker build -t deb_str_base . 
~/starter/docker/service/sdl_core/builder.sh

cd ~/starter/git/sdl/sdl_hmi
docker build -t sdl_hmi -f ~/starter/docker/service/sdl_hmi/Dockerfile .

cd ~/starter/docker/service

sed -i "s/=replace=/$USER/g" ./docker-compose.yaml

docker volume rm service_src
docker volume rm service_build

docker-compose up -d
