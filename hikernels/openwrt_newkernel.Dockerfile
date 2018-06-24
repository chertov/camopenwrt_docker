# FROM openwrt_src

# COPY ./patches/* ./target/linux/hisilicon/patches-3.4.35/
# COPY ./ZFT_Lab.sh ./
# RUN ./ZFT_Lab.sh hi3516cv2

# RUN echo "#!/bin/bash\n \
# # set -e\n \
# # rm -rf /output/*\n \
# cp -r /src/chaos_calmer/bin/hisilicon/* /output/\n \
# " >> copy.sh && chmod 777 copy.sh

# ENTRYPOINT ["./copy.sh"]
# CMD []
# mem=${osmem} console=ttyAMA0,115200 root=/dev/mtdblock1 rootfstype=cramfs mtdparts=hi_sfc:320K(boot),3520K(romfs),2560K(user),1152K(web),320K(custom),320K(mtd)

FROM openwrt
COPY ./patches/* ./target/linux/hisilicon/patches-3.4.35/

# RUN ( make package/example/{clean,prepare} V=s QUILT=1 \
#     && cd ./build_dir/target-arm_arm926ej-s_uClibc-0.9.33.2_eabi/linux-hisilicon/ \
#     && for i in /src/chaos_calmer/target/linux/hisilicon/patches-3.4.35/010-*.patch; do patch -s -p0 < $i; done )

# RUN    make package/kernel/linux/{clean,prepare} V=s QUILT=1 \
#     && cd ./build_dir/target-arm_arm926ej-s_uClibc-0.9.33.2_eabi/linux-hisilicon/ \
#     && quilt refresh \
#     && cd ../../../ \
#     && make -j7 V=s package/kernel/linux/update

RUN make clean
RUN make target/linux/clean -j7
RUN make target/linux/prepare -j7
# RUN make target/linux/refresh -j7 QUILT=1
RUN make target/linux/compile -j7 QUILT=1
# RUN make target/linux/install -j7 V=s QUILT=1
# RUN make target/linux/update

# RUN make package/kernel/linux/clean package/index -i -j7
# RUN make package/kernel/linux/compile package/index -i -j7
# RUN make package/kernel/linux/install package/index -i -j7

# RUN make package/index

RUN make -i -j7
# RUN make target/linux/update

# COPY ./ZFT_Lab.sh ./
# RUN ./ZFT_Lab.sh hi3516cv2
RUN cat ./build_dir/target-arm_arm926ej-s_uClibc-0.9.33.2_eabi/linux-hisilicon/linux-3.4.35/drivers/net/ethernet/hieth-sf/net.c
RUN ls ./build_dir/target-arm_arm926ej-s_uClibc-0.9.33.2_eabi/linux-hisilicon/linux-3.4.35/.pc/platform/

RUN find / -name "hieth-sf"
