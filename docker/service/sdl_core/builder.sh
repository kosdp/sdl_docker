#!/bin/sh

export HOST_BUILD_DIR=/home/$USER/starter/builds/sdl_core
export BUILD_DIR=/opt/sdl_core
export HOST_SOURCE=/home/$USER/starter/git/sdl/sdl_core
export LOCAL_SOURCE=/opt/src
export BUILDER_IMAGE_FILE=/home/$USER/starter/docker/service/sdl_core/Dockerfile

#clean-up
sudo rm -rf $HOST_BUILD_DIR/*

#creating the base docker image
docker build -t sdl_c_builder -f $BUILDER_IMAGE_FILE . 

#building application
docker run -it --name="sdlcoreready" -v "${HOST_SOURCE}":"${LOCAL_SOURCE}" -v "${HOST_BUILD_DIR}":"${BUILD_DIR}" sdl_c_builder:latest \
	sh -c "cd ${BUILD_DIR} && cmake ../src && make && make install"

#registering the container
container=$(docker ps -a | grep "sdlcoreready" | awk '{print $1}')
docker commit $container sdl_core_ready
