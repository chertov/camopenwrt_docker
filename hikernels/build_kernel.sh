#/bin/sh
set -e

# Clean the exited containers, the untagged images (or old images)
( docker rm $( docker ps -a | grep Exit | cut -d ' ' -f 1) || exit 0 )
( docker rmi $(docker images | tail -n +2 | awk '$1 == "<none>" {print $'3'}') || exit 0 )

./make_patch.sh

current_path=$(realpath $(dirname "$0"))

build_kernel () {
    local kernel_version=$1
    local build_imagename=kernel_$kernel_version

    docker build -t $build_imagename -f $(pwd)/kernel_$kernel_version.Dockerfile $(pwd)/data_$kernel_version/
    docker run -it -v $(pwd)/output/:/output/ $build_imagename
}

build_kernel 3.4.35