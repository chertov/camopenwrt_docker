FROM openwrt_src

RUN ./ZFT_Lab.sh hi3516cv2

RUN echo "#!/bin/bash\n \
# set -e\n \
# rm -rf /output/*\n \
cp -r /src/chaos_calmer/bin/hisilicon/* /output/\n \
" >> copy.sh && chmod 777 copy.sh

ENTRYPOINT ["./copy.sh"]
CMD []
