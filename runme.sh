#!/usr/bin/env bash
set -e
set -x
docker build -t lof .
docker run --rm -v "$PWD:/home/libreoffice/app" -e uid="$(id -u)" -e gid="$(id -g)" -it lof /home/libreoffice/app/wrapper.sh "$@"
