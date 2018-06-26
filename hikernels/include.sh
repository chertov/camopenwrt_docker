#/bin/sh
set -e

current_path=$(realpath $(dirname "$0"))

KERNELS=init_data
download_linux_kernel () {
    local kernel_version=$1
    # download original linux kernel
    # https://mirrors.edge.kernel.org/pub/linux/kernel/v4.x/linux-4.14.tar.xz
    # https://mirrors.edge.kernel.org/pub/linux/kernel/v3.x/linux-3.0.8.tar.xz
    # https://mirrors.edge.kernel.org/pub/linux/kernel/v3.x/linux-3.18.20.tar.xz
    # https://mirrors.edge.kernel.org/pub/linux/kernel/v3.x/linux-3.4.35.tar.xz

    local tar_path=$current_path/$KERNELS/linux-$kernel_version.tar.xz
    if [ ! -f $tar_path ]; then
        local kernel_group=v${kernel_version:0:1}.x
        local kernel_url=https://mirrors.edge.kernel.org/pub/linux/kernel/$kernel_group/linux-$kernel_version.tar.xz

        printf "    Can't find linux kernel source archive: $tar_path\n"
        printf "    Try to download: $kernel_url\n"
        curl -o $tar_path $kernel_url
    fi
}

unpack_linux_kernel () {
    local kernel_version=$1
    if [ -d $current_path/linux-$kernel_version ]; then
        printf "Skip 1-3 steps: Linux kernel founded in $current_path/linux-$kernel_version\n"
        return;
    fi
    printf "Step 1: get linux kernel $kernel_version source archive\n"
    local tar_path=$current_path/$KERNELS/linux-$kernel_version.tar.xz
    if [ ! -f $tar_path ]; then
        download_linux_kernel $kernel_version
    fi
    printf "    Archive path: $tar_path\n"
    printf "    Ok!\n"

    printf "Step 2: unpack linux kernel $kernel_version source archive\n"
    # untar
    tar -xpJf $tar_path
    printf "    Ok!\n"
    printf "Step 3: init git repo in linux-$kernel_version, make first commit with original source code\n"
    # init git repo and commit original source code
    ( cd $current_path/linux-$kernel_version && git init && git add . && git commit -m 'init sources' && git tag original_src )
    printf "    Ok!\n"
}

prepare_linux_kernel () {
    local kernel_version=$1
    if [ -d $current_path/linux-$kernel_version ]; then return; fi
    unpack_linux_kernel $kernel_version

    printf "Step 4: apply ztf patches\n"
    # apply all patches
    for i in $current_path/$KERNELS/zft_patches/patches-$kernel_version/*.patch; do patch -s -p0 < $i; done
    printf "    Ok!\n"
    # commit all untracked files
    # ( cd linux-$kernel_version && git add $(git ls-files -o --exclude-standard) && git commit -m 'commit only untracked files' )

    printf "Step 5: commit hisilicon changes\n"
    # commit changes
    ( cd linux-$kernel_version && git add . && git commit -m 'hisilicon changes' && git tag hisilicon )
    printf "    Ok!\n"
}

# Example: make_patch 3.4.35 linux-3.4.5 linux-3.4.y
make_patch () {
    local kernel_version=$1
    local src_prefix=$2
    local dst_prefix=$3

    local hikernels_path=$(realpath $(dirname "$0"))
    if [ ! -d "$hikernels_path/linux-$kernel_version" ]; then prepare_linux_kernel $kernel_version; fi
    local patches_path=$hikernels_path/data_$kernel_version/patches

    if [ ! -d "$patches_path" ]; then mkdir -p $patches_path; fi
    rm -rf $patches_path/*
    echo patches_path $patches_path
    (
        cd $hikernels_path/linux-$kernel_version
        # git diff original_src hisilicon --src-prefix=$src_prefix/ --dst-prefix=$dst_prefix/ > $patches_path/003-hisilicon.patch
        git diff hisilicon HEAD --src-prefix=$src_prefix/ --dst-prefix=$dst_prefix/ > $patches_path/707-commited.patch
        git diff --cached --src-prefix=$src_prefix/ --dst-prefix=$dst_prefix/ > $patches_path/708-cached.patch
        git diff --src-prefix=$src_prefix/ --dst-prefix=$dst_prefix/ > $patches_path/709-index.patch
    )
}

# Example: build_kernel 3.4.35
build_kernel () {
    local kernel_version=$1
    local build_imagename=kernel_$kernel_version

    docker build -t $build_imagename -f $current_path/kernel_$kernel_version.Dockerfile $current_path/data_$kernel_version/
    docker run -it -v $current_path/output/:/output/ $build_imagename
}
