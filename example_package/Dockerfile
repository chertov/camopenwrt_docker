FROM openwrt

# setup rust compile tools
RUN    wget https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init \
    && chmod 777 ./rustup-init \
    && ./rustup-init -y --default-toolchain nightly \
    && ~/.cargo/bin/rustup target add arm-unknown-linux-musleabi \
    && echo "[target.arm-unknown-linux-musleabi]\nlinker = \"arm-openwrt-linux-gcc\"\n" >> ~/.cargo/config

COPY ./hellorust /src/chaos_calmer/camfeed/hellorust
RUN    echo "src-link camfeed /src/chaos_calmer/camfeed" >> ./feeds.conf \
    && ./scripts/feeds update camfeed \
    && ./scripts/feeds install hellorust \
    && echo "\nCONFIG_PACKAGE_hellorust=y\n" >> .config \
    && make -j1 V=s package/hellorust/compile \
    && make -j1 V=s package/hellorust/install

RUN find ./ -name 'hellorust*'

RUN echo "cp /src/chaos_calmer/build_dir/target-arm_arm926ej-s_uClibc-0.9.33.2_eabi/hellorust-0.1/ipkg-hisilicon/hellorust/usr/bin/hellorust \
/output/hellorust\n \
" >> copy.sh
