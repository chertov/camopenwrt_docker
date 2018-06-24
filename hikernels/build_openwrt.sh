#!/bin/bash
set -e
if [ ! -d $(pwd)/output/ ]; then mkdir -p $(pwd)/output/; fi

./make_patch.sh

# Clean the exited containers, the untagged images (or old images)
( docker rm $( docker ps -a | grep Exit | cut -d ' ' -f 1) || exit 0 )
( docker rmi $(docker images | tail -n +2 | awk '$1 == "<none>" {print $'3'}') || exit 0 )

# build image
docker build -t openwrt_fixkernel -f $(pwd)/openwrt_newkernel.Dockerfile $(pwd)/data_3.4.35/

# copy binary firmware to output
docker run -it -v $(pwd)/output/:/output/ openwrt
