#/bin/sh
set -e

# Clean the exited containers, the untagged images (or old images)
( docker rm $( docker ps -a | grep Exit | cut -d ' ' -f 1) || exit 0 )
( docker rmi $(docker images | tail -n +2 | awk '$1 == "<none>" {print $'3'}') || exit 0 )

current_path=$(realpath $(dirname "$0"))
source $current_path/include.sh

make_patch 3.4.35 linux-3.4.5 linux-3.4.y
build_kernel 3.4.35