#!/bin/bash
set -e
if [ ! -d $(pwd)/output/ ]; then mkdir -p $(pwd)/output/; fi

OPENWRT_REPOSITORY=$(pwd)/chaos_calmer/
if [ ! -d "$OPENWRT_REPOSITORY" ]; then
    # repository doesn't exists
    git clone --depth 1 https://github.com/ZigFisher/chaos_calmer.git $OPENWRT_REPOSITORY
else
    git -C $OPENWRT_REPOSITORY pull
fi

# copy sources to image
docker build -t openwrt_src -f $(pwd)/openwrt_src.Dockerfile $(pwd)/chaos_calmer/

# build image
docker build -t openwrt -f $(pwd)/openwrt.Dockerfile $(pwd)/

# copy binary firmware to output
docker run -it -v $(pwd)/output/:/output/ openwrt
