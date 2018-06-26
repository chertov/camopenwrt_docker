FROM debian:stretch

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install \
    build-essential gawk git ncurses-dev python gcc-arm-linux-gnueabi \
    subversion unzip zlib1g-dev libssl-dev wget cpio bc time u-boot-tools

WORKDIR /src/
COPY ./linux-*.tar.xz ./
# RUN    wget https://mirrors.edge.kernel.org/pub/linux/kernel/v3.x/linux-3.0.8.tar.xz \
#     && wget https://mirrors.edge.kernel.org/pub/linux/kernel/v3.x/linux-3.18.20.tar.xz \
#     && wget https://mirrors.edge.kernel.org/pub/linux/kernel/v3.x/linux-3.4.35.tar.xz

RUN    mkdir -p linux-3.0.y \
    && tar -xf linux-3.0.8.tar.xz -C ./linux-3.0.y --strip-components=1 \
    \
    && mkdir -p linux-3.18.y \
    && tar -xf linux-3.18.20.tar.xz -C ./linux-3.18.y --strip-components=1 \
    \
    && mkdir -p linux-3.4.y \
    && tar -xf linux-3.4.35.tar.xz -C ./linux-3.4.y --strip-components=1 \
    \
    && mkdir -p linux-4.14 \
    && tar -xf linux-4.14.tar.xz -C ./linux-4.14 --strip-components=1 \
    \
    && rm linux-*.tar.xz

COPY ./zft_patches ./zft_patches
# RUN for i in ./zft_patches/patches-3.0.8/*.patch; do patch -s -p0 < $i; done
RUN for i in ./zft_patches/patches-3.18.20/*.patch; do patch -s -p0 < $i; done
RUN for i in ./zft_patches/patches-3.4.35/*.patch; do patch -s -p0 < $i; done

COPY ./rootfs.cpio.gz ./
RUN echo "#!/bin/bash\n \
set -e\n \
rm -rf /output/*\n \
cp .config /output\n \
cp arch/arm/boot/uImage /output\n \
" >> copy.sh && chmod 777 copy.sh

ENTRYPOINT ["/src/copy.sh"]
CMD []
