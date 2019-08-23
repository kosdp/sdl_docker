#!/bin/bash

docker build -t sdl_core:latest sdl_core

docker build -t generic_hmi:latest generic_hmi

docker-compose up -d
