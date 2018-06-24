FROM openwrt_src

# platform-specific parameters
# RUN sed -i 's/CONFIG_HIETH_PHYID_U=.*/CONFIG_HIETH_PHYID_U=0/' target/linux/hisilicon/config-3.4.35.phy-xm
# RUN sed -i 's/CONFIG_HIETH_PHYID_D=.*/CONFIG_HIETH_PHYID_D=1/' target/linux/hisilicon/config-3.4.35.phy-xm

RUN ./ZFT_Lab.sh hi3516cv2

RUN echo "#!/bin/bash\n \
# set -e\n \
# rm -rf /output/*\n \
cp -r /src/chaos_calmer/bin/hisilicon/* /output/\n \
" >> copy.sh && chmod 777 copy.sh

ENTRYPOINT ["./copy.sh"]
CMD []
