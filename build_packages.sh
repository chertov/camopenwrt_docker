#!/bin/bash
set -e

# try to build own glutinium repo
GLUTINIUM_REPOSITORY=$(pwd)/glutinium/
if [ ! -d "$GLUTINIUM_REPOSITORY" ]; then
    # repository doesn't exists
    git clone https://github.com/ZigFisher/Glutinium.git $GLUTINIUM_REPOSITORY
else
    git -C $GLUTINIUM_REPOSITORY pull
fi
docker build -t openwrt_glutinium -f $(pwd)/tools.Dockerfile $(pwd)/glutinium/
docker run -it -v $(pwd)/output/:/output/ openwrt_glutinium

# for example let's try to build rust helloworld for openwrt
docker build -t example_package -f $(pwd)/example_package/Dockerfile $(pwd)/example_package/
docker run -it -v $(pwd)/output/:/output/ example_package

# ex: host -> camera
# scp -r ./output/hijpg root@192.168.0.10:/tmp/
# scp -r ./output/rtsp-hisi root@192.168.0.10:/tmp/

# ex: camera -> host
# if [ ! -d $(pwd)/pics/ ]; then mkdir -p $(pwd)/pics/; fi
# scp root@192.168.0.10:/tmp/snap.jpg ./pics/
# scp root@192.168.0.10:/tmp/snap_thumbnail.jpg ./pics/
