FROM kernel_src_3.4.35

RUN locale-gen en_US.utf8
RUN wget https://buildroot.org/downloads/buildroot-2018.05.tar.gz


RUN cp ./arch/arm/configs/hi3518ev200_full_defconfig  ./.config
RUN make ARCH=arm -j7 hi3518ev200_full_defconfig
RUN make ARCH=arm -j7 uImage dtbs modules
RUN echo "#!/bin/bash\n \
# set -e\n \
# rm -rf /output/*\n \
# cp -r /src/chaos_calmer/bin/hisilicon/* /output/\n \
" >> copy.sh && chmod 777 copy.sh

ENTRYPOINT ["./copy.sh"]
CMD []
