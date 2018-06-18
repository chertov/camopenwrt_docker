FROM openwrt

ARG MAKE_ARGS=-j7
#ARG MAKE_ARGS="-j1 V=s"

RUN    ./scripts/feeds update packages \
    && ./scripts/feeds install -a -p packages

RUN    rm -rf ./feeds/packages/multimedia/gstreamer1 \
    && rm -rf ./feeds/packages/multimedia/gst1-plugins-base \
    && rm -rf ./feeds/packages/multimedia/gst1-plugins-bad \
    && rm -rf ./feeds/packages/multimedia/gst1-plugins-ugly \
    && rm -rf ./feeds/packages/multimedia/gst1-plugins-good\
    && rm -rf ./feeds/packages/multimedia/gst1-libav

COPY ./gstreamer1 /src/chaos_calmer/feeds/packages/multimedia/gstreamer1
RUN    ./scripts/feeds install gstreamer1 \
    && make ${MAKE_ARGS} package/gstreamer1/compile \
    && make ${MAKE_ARGS} package/gstreamer1/install

COPY ./gst1-plugins-base /src/chaos_calmer/feeds/packages/multimedia/gst1-plugins-base
RUN    ./scripts/feeds install gst1-plugins-base \
    && make ${MAKE_ARGS} package/gst1-plugins-base/compile \
    && make ${MAKE_ARGS} package/gst1-plugins-base/install

COPY ./gst1-plugins-good /src/chaos_calmer/feeds/packages/multimedia/gst1-plugins-good
RUN    ./scripts/feeds install gst1-plugins-good \
    && make ${MAKE_ARGS} package/gst1-plugins-good/compile \
    && make ${MAKE_ARGS} package/gst1-plugins-good/install

COPY ./gst1-plugins-bad /src/chaos_calmer/feeds/packages/multimedia/gst1-plugins-bad
RUN    ./scripts/feeds install gst1-plugins-bad \
    && make ${MAKE_ARGS} package/gst1-plugins-bad/compile \
    && make ${MAKE_ARGS} package/gst1-plugins-bad/install

COPY ./gst1-plugins-ugly /src/chaos_calmer/feeds/packages/multimedia/gst1-plugins-ugly
RUN    ./scripts/feeds install gst1-plugins-ugly \
    && make ${MAKE_ARGS} package/gst1-plugins-ugly/compile \
    && make ${MAKE_ARGS} package/gst1-plugins-ugly/install

RUN    echo "\nCONFIG_PACKAGE_libgstreamer1=y\n" >> .config \
    && echo "\nCONFIG_PACKAGE_gstreamer1-plugins-base=y\n" >> .config \
    && echo "\nCONFIG_PACKAGE_gst1-mod-alsa=y\n" >> .config \
    && echo "\nCONFIG_PACKAGE_libgst1audio=y\n" >> .config \
    && echo "\nCONFIG_PACKAGE_libgst1pbutils=y\n" >> .config \
    && echo "\nCONFIG_PACKAGE_libgst1video=y\n" >> .config \
    && echo "\nCONFIG_PACKAGE_libgst1video=y\n" >> .config \
    && echo "\nCONFIG_PACKAGE_libbz2=y\n" >> .config \
    && echo "\nCONFIG_PACKAGE_liblzma=y\n" >> .config \
    && echo "\nCONFIG_PACKAGE_glib2=y\n" >> .config \
    && echo "\nCONFIG_PACKAGE_libattr=y\n" >> .config \
    && echo "\nCONFIG_PACKAGE_libffi=y\n" >> .config \
    && echo "\nCONFIG_PACKAGE_zlib=y\n" >> .config \
    && echo "\nCONFIG_PACKAGE_librt=y\n" >> .config

#
# RUN    echo "\nCONFIG_PACKAGE_librt=y\n" >> .config \
#     && echo "\nCONFIG_PACKAGE_glib2=y\n" >> .config \
#     && echo "\nCONFIG_PACKAGE_libbz2=y\n" >> .config \
#     && echo "\nCONFIG_PACKAGE_liblzma=y\n" >> .config \
#     && echo "\nCONFIG_PACKAGE_zlib=y\n" >> .config \
#     && echo "\nCONFIG_PACKAGE_libattr=y\n" >> .config \
#     && echo "\nCONFIG_PACKAGE_libffi=y\n" >> .config

COPY ./gst1-libav /src/chaos_calmer/feeds/packages/multimedia/gst1-libav
RUN    ./scripts/feeds install gst1-libav \
    && echo "\nCONFIG_PACKAGE_gst1-libav=y\n" >> .config \
    && make -j1 V=s package/gst1-libav/compile \
    && make -j1 V=s package/gst1-libav/install

RUN find ./ -name 'gst*'

# RUN echo "cp /src/chaos_calmer/build_dir/target-arm_arm926ej-s_uClibc-0.9.33.2_eabi/hellorust-0.1/ipkg-hisilicon/hellorust/usr/bin/hellorust \
# /output/hellorust\n \
# " >> copy.sh
