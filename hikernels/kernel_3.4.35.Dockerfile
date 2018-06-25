FROM kernels_src

ARG MAKE_ARGS=-j7

WORKDIR /src/linux-3.4.y/
RUN    cp arch/arm/configs/hi3518ev200_full_defconfig .config \
    && sed -i "s/CONFIG_INITRAMFS_SOURCE=\"\"/CONFIG_INITRAMFS_SOURCE=\"\/src\/rootfs\.cpio\.gz\"/g" .config \
    && printf "\nCONFIG_INITRAMFS_ROOT_UID=0\n\
CONFIG_INITRAMFS_ROOT_GID=0\n" >> .config

RUN    make ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi- ${MAKE_ARGS} oldconfig \
    && make ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi- ${MAKE_ARGS} uImage modules dtbs

COPY ./patches /src/patches

# ARG MAKE_ARGS="-j1 V=s"
RUN ( cd /src/ && for i in ./patches/*.patch; do patch -s -p0 < $i; done ) \
    && make ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi- ${MAKE_ARGS} uImage modules dtbs

RUN ls /src
