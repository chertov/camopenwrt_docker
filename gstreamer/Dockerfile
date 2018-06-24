FROM openwrt

ARG MAKE_ARGS=-j7
# ARG MAKE_ARGS="-j1 V=s"

RUN    ./scripts/feeds update packages \
    && ./scripts/feeds install -a -p packages

RUN    printf "CONFIG_PACKAGE_librt=y\n" >> .config
RUN    printf "CONFIG_PACKAGE_libattr=y\n" >> .config
RUN    printf "CONFIG_PACKAGE_libffi=y\n" >> .config \
    && make ${MAKE_ARGS} package/libffi/compile \
    && make ${MAKE_ARGS} package/libffi/install
RUN    printf "CONFIG_PACKAGE_zlib=y\n" >> .config \
    && make ${MAKE_ARGS} package/zlib/compile \
    && make ${MAKE_ARGS} package/zlib/install
RUN    printf "CONFIG_PACKAGE_glib2=y\n" >> .config \
    && make ${MAKE_ARGS} package/glib2/compile \
    && make ${MAKE_ARGS} package/glib2/install
RUN    printf "\nCONFIG_PACKAGE_libxml2=y\n" >> .config \
    && make ${MAKE_ARGS} package/libxml2/compile \
    && make ${MAKE_ARGS} package/libxml2/install

RUN    printf "CONFIG_PACKAGE_libbz2=y\n" >> .config
RUN    printf "CONFIG_PACKAGE_liblzma=y\n" >> .config

RUN    printf "CONFIG_PACKAGE_alsa-lib=y\n" >> .config \
    && make ${MAKE_ARGS} package/alsa-lib/compile \
    && make ${MAKE_ARGS} package/alsa-lib/install
RUN    printf "CONFIG_PACKAGE_libogg=y\n" >> .config \
    && make ${MAKE_ARGS} package/libogg/compile \
    && make ${MAKE_ARGS} package/libogg/install
RUN    printf "CONFIG_PACKAGE_liboil=y\n" >> .config \
    && make ${MAKE_ARGS} package/liboil/compile \
    && make ${MAKE_ARGS} package/liboil/install
RUN    printf "CONFIG_PACKAGE_libopus=y\n" >> .config
RUN    printf "CONFIG_PACKAGE_libvorbis=y\n" >> .config \
    && make ${MAKE_ARGS} package/libvorbis/compile \
    && make ${MAKE_ARGS} package/libvorbis/install
RUN    printf "CONFIG_PACKAGE_libtheora=y\n" >> .config \
    && make ${MAKE_ARGS} package/libtheora/compile \
    && make ${MAKE_ARGS} package/libtheora/install

RUN    printf "CONFIG_PACKAGE_libflac=y\n" >> .config
RUN    printf "CONFIG_PACKAGE_libjpeg=y\n" >> .config \
    && make ${MAKE_ARGS} package/libjpeg/compile \
    && make ${MAKE_ARGS} package/libjpeg/install
RUN    printf "CONFIG_PACKAGE_libpng=y\n" >> .config \
    && make ${MAKE_ARGS} package/libpng/compile \
    && make ${MAKE_ARGS} package/libpng/install
RUN    printf "CONFIG_PACKAGE_libsqlite3=y\n" >> .config
RUN    printf "CONFIG_PACKAGE_libsoup=y\n" >> .config \
    && make ${MAKE_ARGS} package/libsoup/compile \
    && make ${MAKE_ARGS} package/libsoup/install
RUN    printf "CONFIG_PACKAGE_libv4l=y\n" >> .config \
    && make ${MAKE_ARGS} package/libv4l/compile \
    && make ${MAKE_ARGS} package/libv4l/install
RUN    printf "CONFIG_PACKAGE_libvpx=y\n" >> .config \
    && make ${MAKE_ARGS} package/libvpx/compile \
    && make ${MAKE_ARGS} package/libvpx/install

RUN    printf "CONFIG_PACKAGE_libnettle=y\n" >> .config
RUN    printf "CONFIG_PACKAGE_libopus=y\n" >> .config
RUN    printf "CONFIG_PACKAGE_libsrtp=y\n" >> .config

RUN    printf "CONFIG_PACKAGE_lame-lib=y\n" >> .config
RUN    printf "CONFIG_PACKAGE_libid3tag=y\n" >> .config \
    && make ${MAKE_ARGS} package/libid3tag/compile \
    && make ${MAKE_ARGS} package/libid3tag/install
RUN    printf "CONFIG_PACKAGE_mpg123=y\n" >> .config
RUN    printf "CONFIG_PACKAGE_libmpeg2=y\n" >> .config \
    && make ${MAKE_ARGS} package/libmpeg2/compile \
    && make ${MAKE_ARGS} package/libmpeg2/install


RUN    rm -rf ./feeds/packages/multimedia/gstreamer1 \
    && rm -rf ./feeds/packages/multimedia/gst1-plugins-base \
    && rm -rf ./feeds/packages/multimedia/gst1-plugins-bad \
    && rm -rf ./feeds/packages/multimedia/gst1-plugins-ugly \
    && rm -rf ./feeds/packages/multimedia/gst1-plugins-good\
    && rm -rf ./feeds/packages/multimedia/gst1-libav

RUN printf "\n\
CONFIG_PACKAGE_gst1-libav=y\n\
CONFIG_PACKAGE_gst1-mod-adpcmdec=y\n\
CONFIG_PACKAGE_gst1-mod-adpcmenc=y\n\
CONFIG_PACKAGE_gst1-mod-aiff=y\n\
CONFIG_PACKAGE_gst1-mod-alaw=y\n\
CONFIG_PACKAGE_gst1-mod-alpha=y\n\
CONFIG_PACKAGE_gst1-mod-alphacolor=y\n\
CONFIG_PACKAGE_gst1-mod-alsa=y\n\
CONFIG_PACKAGE_gst1-mod-apetag=y\n\
CONFIG_PACKAGE_gst1-mod-app=y\n\
CONFIG_PACKAGE_gst1-mod-asf=y\n\
CONFIG_PACKAGE_gst1-mod-asfmux=y\n\
CONFIG_PACKAGE_gst1-mod-audioconvert=y\n\
CONFIG_PACKAGE_gst1-mod-audiofx=y\n\
CONFIG_PACKAGE_gst1-mod-audioparsers=y\n\
CONFIG_PACKAGE_gst1-mod-audiorate=y\n\
CONFIG_PACKAGE_gst1-mod-audioresample=y\n\
CONFIG_PACKAGE_gst1-mod-audiotestsrc=y\n\
CONFIG_PACKAGE_gst1-mod-auparse=y\n\
CONFIG_PACKAGE_gst1-mod-autoconvert=y\n\
CONFIG_PACKAGE_gst1-mod-autodetect=y\n\
CONFIG_PACKAGE_gst1-mod-avi=y\n\
CONFIG_PACKAGE_gst1-mod-bayer=y\n\
CONFIG_PACKAGE_gst1-mod-camerabin2=y\n\
CONFIG_PACKAGE_gst1-mod-cutter=y\n\
CONFIG_PACKAGE_gst1-mod-dataurisrc=y\n\
CONFIG_PACKAGE_gst1-mod-debug=y\n\
CONFIG_PACKAGE_gst1-mod-debugutilsbad=y\n\
CONFIG_PACKAGE_gst1-mod-deinterlace=y\n\
CONFIG_PACKAGE_gst1-mod-dtmf=y\n\
CONFIG_PACKAGE_gst1-mod-dvdspu=y\n\
CONFIG_PACKAGE_gst1-mod-effectv=y\n\
CONFIG_PACKAGE_gst1-mod-equalizer=y\n\
CONFIG_PACKAGE_gst1-mod-festival=y\n\
CONFIG_PACKAGE_gst1-mod-flac=y\n\
CONFIG_PACKAGE_gst1-mod-flv=y\n\
CONFIG_PACKAGE_gst1-mod-flxdec=y\n\
CONFIG_PACKAGE_gst1-mod-frei0r=y\n\
CONFIG_PACKAGE_gst1-mod-gio=y\n\
CONFIG_PACKAGE_gst1-mod-goom=y\n\
CONFIG_PACKAGE_gst1-mod-goom2k1=y\n\
CONFIG_PACKAGE_gst1-mod-icydemux=y\n\
CONFIG_PACKAGE_gst1-mod-id3demux=y\n\
CONFIG_PACKAGE_gst1-mod-id3tag=y\n\
CONFIG_PACKAGE_gst1-mod-imagefreeze=y\n\
CONFIG_PACKAGE_gst1-mod-interleave=y\n\
CONFIG_PACKAGE_gst1-mod-isomp4=y\n\
CONFIG_PACKAGE_gst1-mod-jpeg=y\n\
CONFIG_PACKAGE_gst1-mod-jpegformat=y\n\
CONFIG_PACKAGE_gst1-mod-lame=y\n\
CONFIG_PACKAGE_gst1-mod-level=y\n\
CONFIG_PACKAGE_gst1-mod-liveadder=y\n\
CONFIG_PACKAGE_gst1-mod-mad=y\n\
CONFIG_PACKAGE_gst1-mod-matroska=y\n\
CONFIG_PACKAGE_gst1-mod-mpeg2dec=y\n\
CONFIG_PACKAGE_gst1-mod-mpegpsdemux=y\n\
CONFIG_PACKAGE_gst1-mod-mpegpsmux=y\n\
CONFIG_PACKAGE_gst1-mod-mulaw=y\n\
CONFIG_PACKAGE_gst1-mod-multifile=y\n\
CONFIG_PACKAGE_gst1-mod-multipart=y\n\
CONFIG_PACKAGE_gst1-mod-mxf=y\n\
CONFIG_PACKAGE_gst1-mod-navigationtest=y\n\
CONFIG_PACKAGE_gst1-mod-ogg=y\n\
CONFIG_PACKAGE_gst1-mod-opus=y\n\
CONFIG_PACKAGE_gst1-mod-oss4audio=y\n\
CONFIG_PACKAGE_gst1-mod-ossaudio=y\n\
CONFIG_PACKAGE_gst1-mod-pcapparse=y\n\
CONFIG_PACKAGE_gst1-mod-playback=y\n\
CONFIG_PACKAGE_gst1-mod-png=y\n\
CONFIG_PACKAGE_gst1-mod-pnm=y\n\
CONFIG_PACKAGE_gst1-mod-rawparse=y\n\
CONFIG_PACKAGE_gst1-mod-replaygain=y\n\
CONFIG_PACKAGE_gst1-mod-rfbsrc=y\n\
CONFIG_PACKAGE_gst1-mod-rtp=y\n\
CONFIG_PACKAGE_gst1-mod-rtpmanager=y\n\
CONFIG_PACKAGE_gst1-mod-rtsp=y\n\
CONFIG_PACKAGE_gst1-mod-sdpelem=y\n\
CONFIG_PACKAGE_gst1-mod-segmentclip=y\n\
CONFIG_PACKAGE_gst1-mod-shapewipe=y\n\
CONFIG_PACKAGE_gst1-mod-shm=y\n\
CONFIG_PACKAGE_gst1-mod-siren=y\n\
CONFIG_PACKAGE_gst1-mod-smpte=y\n\
CONFIG_PACKAGE_gst1-mod-souphttpsrc=y\n\
CONFIG_PACKAGE_gst1-mod-spectrum=y\n\
CONFIG_PACKAGE_gst1-mod-speed=y\n\
CONFIG_PACKAGE_gst1-mod-subenc=y\n\
CONFIG_PACKAGE_gst1-mod-tcp=y\n\
CONFIG_PACKAGE_gst1-mod-theora=y\n\
CONFIG_PACKAGE_gst1-mod-typefindfunctions=y\n\
CONFIG_PACKAGE_gst1-mod-udp=y\n\
CONFIG_PACKAGE_gst1-mod-video4linux2=y\n\
CONFIG_PACKAGE_gst1-mod-videobox=y\n\
CONFIG_PACKAGE_gst1-mod-videoconvert=y\n\
CONFIG_PACKAGE_gst1-mod-videocrop=y\n\
CONFIG_PACKAGE_gst1-mod-videofilter=y\n\
CONFIG_PACKAGE_gst1-mod-videomixer=y\n\
CONFIG_PACKAGE_gst1-mod-videorate=y\n\
CONFIG_PACKAGE_gst1-mod-videoscale=y\n\
CONFIG_PACKAGE_gst1-mod-videotestsrc=y\n\
CONFIG_PACKAGE_gst1-mod-volume=y\n\
CONFIG_PACKAGE_gst1-mod-vorbis=y\n\
CONFIG_PACKAGE_gst1-mod-vpx=y\n\
CONFIG_PACKAGE_gst1-mod-wavenc=y\n\
CONFIG_PACKAGE_gst1-mod-wavparse=y\n\
CONFIG_PACKAGE_gst1-plugins-bad=y\n\
CONFIG_PACKAGE_gst1-plugins-base=y\n\
CONFIG_PACKAGE_gst1-plugins-good=y\n\
CONFIG_PACKAGE_gst1-plugins-ugly=y\n\
CONFIG_PACKAGE_gstreamer1=y\n\
CONFIG_PACKAGE_gstreamer1-libs=y\n\
CONFIG_PACKAGE_gstreamer1-plugins-bad=y\n\
CONFIG_PACKAGE_gstreamer1-plugins-base=y\n\
CONFIG_PACKAGE_gstreamer1-plugins-good=y\n\
CONFIG_PACKAGE_gstreamer1-plugins-ugly=y\n\
CONFIG_PACKAGE_gstreamer1-utils=y\n\
CONFIG_PACKAGE_libgst1allocators=y\n\
CONFIG_PACKAGE_libgst1app=y\n\
CONFIG_PACKAGE_libgst1audio=y\n\
CONFIG_PACKAGE_libgst1basecamerabinsrc=y\n\
CONFIG_PACKAGE_libgst1check=y\n\
CONFIG_PACKAGE_libgst1controller=y\n\
CONFIG_PACKAGE_libgst1fft=y\n\
CONFIG_PACKAGE_libgst1net=y\n\
CONFIG_PACKAGE_libgst1pbutils=y\n\
CONFIG_PACKAGE_libgst1photography=y\n\
CONFIG_PACKAGE_libgst1riff=y\n\
CONFIG_PACKAGE_libgst1rtp=y\n\
CONFIG_PACKAGE_libgst1rtsp=y\n\
CONFIG_PACKAGE_libgst1sdp=y\n\
CONFIG_PACKAGE_libgst1tag=y\n\
CONFIG_PACKAGE_libgst1video=y\n\
CONFIG_PACKAGE_libgstreamer1=y\n\
" >> .config

COPY ./gstreamer1 /src/chaos_calmer/feeds/packages/multimedia/gstreamer1
RUN    make ${MAKE_ARGS} package/gstreamer1/compile \
    && make ${MAKE_ARGS} package/gstreamer1/install

# RUN printf "\n\
# CONFIG_PACKAGE_alsa-lib=y\n\
# CONFIG_PACKAGE_libogg=y\n\
# CONFIG_PACKAGE_liboil=y\n\
# CONFIG_PACKAGE_libopus=y\n\
# CONFIG_PACKAGE_libvorbis=y\n\
# CONFIG_PACKAGE_libtheora=y\n\
# " >> .config
COPY ./gst1-plugins-base /src/chaos_calmer/feeds/packages/multimedia/gst1-plugins-base
RUN    ( make ${MAKE_ARGS} package/gst1-plugins-base/compile; exit 0) \
    && ( make ${MAKE_ARGS} package/gst1-plugins-base/install; exit 0)

# RUN printf "\n\
# CONFIG_PACKAGE_libflac=y\n\
# CONFIG_PACKAGE_libjpeg=y\n\
# CONFIG_PACKAGE_libpng=y\n\
# CONFIG_PACKAGE_libsoup=y\n\
# CONFIG_PACKAGE_libv4l=y\n\
# CONFIG_PACKAGE_libvpx=y\n\
# " >> .config

RUN    printf "CONFIG_PACKAGE_libgmp=y\n" >> .config
COPY ./gst1-plugins-good /src/chaos_calmer/feeds/packages/multimedia/gst1-plugins-good
RUN    make ${MAKE_ARGS} package/gst1-plugins-good/compile \
    && make ${MAKE_ARGS} package/gst1-plugins-good/install

# RUN printf "\n\
# CONFIG_PACKAGE_libnettle=y\n\
# CONFIG_PACKAGE_libopus=y\n\
# CONFIG_PACKAGE_librt=y\n\
# CONFIG_PACKAGE_libsrtp=y\n\
# " >> .config
COPY ./gst1-plugins-bad /src/chaos_calmer/feeds/packages/multimedia/gst1-plugins-bad
RUN    make ${MAKE_ARGS} package/gst1-plugins-bad/compile \
    && make ${MAKE_ARGS} package/gst1-plugins-bad/install

# RUN printf "\n\
# CONFIG_PACKAGE_lame-lib=y\n\
# CONFIG_PACKAGE_libid3tag=y\n\
# CONFIG_PACKAGE_mpg123=y\n\
# CONFIG_PACKAGE_libmpeg2=y\n\
# " >> .config
ARG MAKE_ARGS="-j1 V=s"
COPY ./gst1-plugins-ugly /src/chaos_calmer/feeds/packages/multimedia/gst1-plugins-ugly
RUN    make ${MAKE_ARGS} package/gst1-plugins-ugly/compile \
    && make ${MAKE_ARGS} package/gst1-plugins-ugly/install

RUN find ./ -name '*gst*.ipk'
# RUN printf "\n\
# CONFIG_PACKAGE_libbz2=y\n\
# CONFIG_PACKAGE_liblzma=y\n\
# " >> .config
COPY ./gst1-libav /src/chaos_calmer/feeds/packages/multimedia/gst1-libav
RUN    make -j1 V=s package/gst1-libav/compile \
    && make -j1 V=s package/gst1-libav/install

RUN find ./ -name '*gst*.ipk'


# RUN    ./scripts/feeds install gstreamer1 \
#     && printf "\nCONFIG_PACKAGE_gstreamer1=y\n" >> .config \
#     && make ${MAKE_ARGS} package/gstreamer1/compile \
#     && make ${MAKE_ARGS} package/gstreamer1/install

# COPY ./gstreamer1 /src/chaos_calmer/feeds/packages/multimedia/gstreamer1
# RUN    ./scripts/feeds install gstreamer1 \
#     && printf "\nCONFIG_PACKAGE_gstreamer1=y\n" >> .config \
#     && make ${MAKE_ARGS} package/gstreamer1/compile \
#     && make ${MAKE_ARGS} package/gstreamer1/install

# COPY ./gst1-plugins-base /src/chaos_calmer/feeds/packages/multimedia/gst1-plugins-base
# RUN    ./scripts/feeds install gst1-plugins-base \
#     && printf "\nCONFIG_PACKAGE_gst1-plugins-base=y\n" >> .config \
#     && make ${MAKE_ARGS} package/gst1-plugins-base/compile \
#     && make ${MAKE_ARGS} package/gst1-plugins-base/install

# COPY ./gst1-plugins-good /src/chaos_calmer/feeds/packages/multimedia/gst1-plugins-good
# RUN    ./scripts/feeds install gst1-plugins-good \
#     && printf "\nCONFIG_PACKAGE_gst1-plugins-good=y\n" >> .config \
#     && make ${MAKE_ARGS} package/gst1-plugins-good/compile \
#     && make ${MAKE_ARGS} package/gst1-plugins-good/install

# COPY ./gst1-plugins-bad /src/chaos_calmer/feeds/packages/multimedia/gst1-plugins-bad
# RUN    ./scripts/feeds install gst1-plugins-bad \
#     && printf "\nCONFIG_PACKAGE_gst1-plugins-bad=y\n" >> .config \
#     && make ${MAKE_ARGS} package/gst1-plugins-bad/compile \
#     && make ${MAKE_ARGS} package/gst1-plugins-bad/install

# COPY ./gst1-plugins-ugly /src/chaos_calmer/feeds/packages/multimedia/gst1-plugins-ugly
# RUN    ./scripts/feeds install gst1-plugins-ugly \
#     && printf "\nCONFIG_PACKAGE_gst1-plugins-ugly=y\n" >> .config \
#     && make ${MAKE_ARGS} package/gst1-plugins-ugly/compile \
#     && make ${MAKE_ARGS} package/gst1-plugins-ugly/install

# RUN    printf "\nCONFIG_PACKAGE_libgstreamer1=y\n" >> .config \
#     && printf "\nCONFIG_PACKAGE_libgst1audio=y\n" >> .config \
#     && printf "\nCONFIG_PACKAGE_libgst1pbutils=y\n" >> .config \
#     && printf "\nCONFIG_PACKAGE_libgst1video=y\n" >> .config \
#     && printf "\nCONFIG_PACKAGE_glib2=y\n" >> .config \
#     && printf "\nCONFIG_PACKAGE_zlib=y\n" >> .config \
#     && printf "\nCONFIG_PACKAGE_libbz2=y\n" >> .config \
#     && printf "\nCONFIG_PACKAGE_liblzma=y\n" >> .config \
#     && printf "\nCONFIG_PACKAGE_libattr=y\n" >> .config \
#     && printf "\nCONFIG_PACKAGE_libffi=y\n" >> .config

# COPY ./gst1-libav /src/chaos_calmer/feeds/packages/multimedia/gst1-libav
# RUN    ./scripts/feeds install gst1-libav \
#     && printf "\nCONFIG_PACKAGE_gst1-libav=y\n" >> .config \
#     && make -j1 V=s package/gst1-libav/compile \
#     && make -j1 V=s package/gst1-libav/install
