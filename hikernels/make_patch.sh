#/bin/sh
set -e

function make_patch {
    local kernel_version=$1
    if [ ! -d "./linux-$kernel_version" ]; then return; fi

    local patches_path=$(pwd)/data_$kernel_version/patches/
    if [ ! -d "$patches_path" ]; then mkdir -p $patches_path; fi

    (
        cd linux-$kernel_version
        git diff --src-prefix=linux-3.4.35/ --dst-prefix=linux-3.4.y/ > $patches_path/010-ethernet.patch
    )
}

# init and apply patches
#make_patch 3.0.8
#make_patch 3.18.20
make_patch 3.4.35
