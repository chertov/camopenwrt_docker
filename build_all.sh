#!/bin/bash
set -e

./build_base_image.sh
./build_packages.sh
./build_gstreamer.sh
