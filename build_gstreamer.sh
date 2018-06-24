#!/bin/bash
set -e

# # Clean the exited containers, the untagged images (or old images)
# ( docker rm $( docker ps -a | grep Exit | cut -d ' ' -f 1) || exit 0 )
# ( docker rmi $(docker images | tail -n +2 | awk '$1 == "<none>" {print $'3'}') || exit 0 )

docker build -t gstreamer -f $(pwd)/gstreamer/Dockerfile $(pwd)/gstreamer/
docker run -it -v $(pwd)/output/:/output/ gstreamer
