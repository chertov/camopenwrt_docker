#!/bin/bash
set -e

docker build -t gstreamer -f $(pwd)/gstreamer/Dockerfile $(pwd)/gstreamer/
docker run -it -v $(pwd)/output/:/output/ gstreamer
