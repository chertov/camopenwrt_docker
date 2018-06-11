FROM openwrt

RUN  ./scripts/feeds update glutinium
COPY ./hisi-osdrv2 /src/chaos_calmer/feeds/glutinium/hisi-osdrv2
COPY ./hisi-sample /src/chaos_calmer/feeds/glutinium/hisi-sample

RUN ./scripts/feeds install hisi-osdrv2 \
    && echo "\nCONFIG_PACKAGE_hisi-osdrv2=y\n" >> .config

RUN ./scripts/feeds install hisi-sample \
    && echo "\nCONFIG_PACKAGE_hisi-sample=y\n" >> .config \
    && (make -j1 V=s package/hisi-sample/compile; exit 0) \
    && (make -j1 V=s package/hisi-sample/install; exit 0)

RUN find ./ -name 'rtsp-hi*'
RUN find ./ -name 'hijp*'

RUN echo "cp /src/chaos_calmer/build_dir/target-arm_arm926ej-s_uClibc-0.9.33.2_eabi/hisi-sample-0.1/ipkg-install/usr/bin/rtsp-hisi /output/rtsp-hisi\n \
cp /src/chaos_calmer/build_dir/target-arm_arm926ej-s_uClibc-0.9.33.2_eabi/hisi-sample-0.1/ipkg-install/usr/bin/hijpg /output/hijpg\n \
" >> copy.sh
