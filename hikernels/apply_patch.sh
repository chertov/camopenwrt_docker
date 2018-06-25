#/bin/sh
set -e

# https://mirrors.edge.kernel.org/pub/linux/kernel/v4.x/linux-4.14.tar.xz
# https://mirrors.edge.kernel.org/pub/linux/kernel/v3.x/linux-3.0.8.tar.xz
# https://mirrors.edge.kernel.org/pub/linux/kernel/v3.x/linux-3.18.20.tar.xz
# https://mirrors.edge.kernel.org/pub/linux/kernel/v3.x/linux-3.4.35.tar.xz

KERNELS=./init_data/
if [ ! -d "$KERNELS" ]; then mkdir $KERNELS; fi

init_kernel () {
    local kernel_version=$1
    local kernel_group=v${kernel_version:0:1}.x
    if [ -d ./linux-$kernel_version ]; then return; fi
    # download original linux kernel
    if [ ! -f ./$KERNELS/linux-$kernel_version.tar.xz ]; then
        curl -o ./$KERNELS/linux-$kernel_version.tar.xz https://mirrors.edge.kernel.org/pub/linux/kernel/$kernel_group/linux-$kernel_version.tar.xz
    fi
    # untar, init git repo and commit original source code
    ( tar -xpJf ./$KERNELS/linux-$kernel_version.tar.xz && cd linux-$kernel_version && git init && git add . && git commit -m 'init sources' )
}

apply_patches () {
    local kernel_version=$1
    if [ -d ./linux-$kernel_version ]; then return; fi
    init_kernel $kernel_version
    # apply all patches
    for i in ./patches-$kernel_version/*.patch; do patch -s -p0 < $i; done
    # commit all untracked files
    # ( cd linux-$kernel_version && git add $(git ls-files -o --exclude-standard) && git commit -m 'commit only untracked files' )

    # commit changes
    ( cd linux-$kernel_version && git add . && git commit -m 'hisilicon changes' )
}

#init the latest lts kernel
init_kernel 4.14

# init and apply patches
apply_patches 3.0.8
apply_patches 3.18.20
apply_patches 3.4.35
