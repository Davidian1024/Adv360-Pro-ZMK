#!/usr/bin/env bash

set -e

docker run -it --name zmk zmk
docker cp zmk:/app/firmware/ ./
docker stop zmk
docker rm zmk
find ./firmware | tail -2 | paste - - | awk '{system("ln -sf "$1" latest-left.uf2; ln -sf "$2" latest-right.uf2;")}'