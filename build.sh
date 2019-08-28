#!/bin/bash

if [[ $1 = "stop" ]]
then
  docker-compose down; exit
fi

sed "s/localhost/${HOSTNAME}/g" sdl_core/sdl_preloaded_pt.json > sdl_core/sdl_preloaded_pt.json.new \
&& docker build -t sdl_core:latest sdl_core \
&& docker build -t generic_hmi:latest generic_hmi \
&& docker build -t sdl_atf:latest sdl_atf \
&& rm sdl_core/sdl_preloaded_pt.json.new \
&& docker-compose up -d
