#/bin/sh
set -e

function build_kernel {
    local kernel_version=$1
    local src_imagename=kernel_src_$kernel_version
    local build_imagename=kernel_$kernel_version

    docker build -t $src_imagename -f $(pwd)/kernel_copy_src.Dockerfile $(pwd)/linux-$kernel_version/
    docker build -t $build_imagename -f $(pwd)/kernel_$kernel_version.Dockerfile $(pwd)
    docker run -it -v $(pwd)/output/:/output/ $build_imagename
}

build_kernel 3.4.35