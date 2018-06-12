FROM openwrt

# RUN  ./scripts/feeds update glutinium
# # COPY ./hisi-osdrv2 /src/chaos_calmer/feeds/glutinium/hisi-osdrv2
# # COPY ./hisi-sample /src/chaos_calmer/feeds/glutinium/hisi-sample
#
# RUN ./scripts/feeds install hisi-osdrv2 \
#     && printf "\nCONFIG_PACKAGE_hisi-osdrv2=y\n" >> .config
#

RUN ./scripts/feeds install hisi-sample \
    && printf "\nCONFIG_PACKAGE_hisi-sample=y\n" >> .config \
    && make -j1 V=s package/hisi-sample/compile \
    && make -j1 V=s package/hisi-sample/install

# RUN make package/index V=99

RUN ls -al bin/hisilicon/packages/
RUN ls -al bin/hisilicon/packages/glutinium/
RUN find / -name 'rtsp-hi*'
RUN find / -name 'hijp*'
RUN find / -name 'hisi-sampl*'
RUN find / -name 'libVoiceEngine.s*'

RUN echo "cp /src/chaos_calmer/build_dir/target-arm_arm926ej-s_uClibc-0.9.33.2_eabi/hisi-sample-0.1/ipkg-install/usr/bin/rtsp-hisi /output/rtsp-hisi\n \
cp /src/chaos_calmer/build_dir/target-arm_arm926ej-s_uClibc-0.9.33.2_eabi/hisi-sample-0.1/ipkg-install/usr/bin/hijpg /output/hijpg\n \
cp /src/chaos_calmer/.config /output/.config\n \
" >> copy.sh
