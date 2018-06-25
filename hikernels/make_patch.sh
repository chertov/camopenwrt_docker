#/bin/sh
set -e


make_patch () {
    local kernel_version=$1
    local hikernels_path=$(realpath $(dirname "$0"))
    if [ ! -d "$hikernels_path/linux-$kernel_version" ]; then return; fi
    local patches_path=$hikernels_path/data_$kernel_version/patches/
    echo $patches_path
    if [ ! -d "$patches_path" ]; then mkdir -p $patches_path; fi

    (
        cd $hikernels_path/linux-$kernel_version
        git diff --src-prefix=linux-3.4.35/ --dst-prefix=linux-3.4.y/ > $patches_path/010-ethernet.patch
    )
}

# init and apply patches
#make_patch 3.0.8
#make_patch 3.18.20
make_patch 3.4.35
