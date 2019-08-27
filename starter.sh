#!/bin/bash

if [[ $1 = "stop" ]]
then
  docker-compose down; exit
fi

sed -i "s/localhost/${HOSTNAME}/g" sdl_core/sdl_preloaded_pt.json \
&& docker build -t sdl_core:latest sdl_core \
&& docker build -t generic_hmi:latest generic_hmi \
&& docker-compose up -d
