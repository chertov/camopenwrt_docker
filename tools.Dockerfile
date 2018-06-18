FROM openwrt

ARG MAKE_ARGS=-j7
#ARG MAKE_ARGS="-j1 V=s"

COPY ./hisi-sample /src/chaos_calmer/feeds/glutinium/hisi-sample
RUN    make ${MAKE_ARGS} package/hisi-sample/compile \
    && make ${MAKE_ARGS} package/hisi-sample/install

RUN echo "cp /src/chaos_calmer/build_dir/target-arm_arm926ej-s_uClibc-0.9.33.2_eabi/hisi-sample-0.1/ipkg-install/usr/bin/rtsp-hisi /output/rtsp-hisi\n \
cp /src/chaos_calmer/build_dir/target-arm_arm926ej-s_uClibc-0.9.33.2_eabi/hisi-sample-0.1/ipkg-install/usr/bin/hijpg /output/hijpg\n \
cp /src/chaos_calmer/.config /output/.config\n \
" >> copy.sh
