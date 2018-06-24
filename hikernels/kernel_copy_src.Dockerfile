FROM debian:jessie

# RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install \
#     build-essential gawk libncurses-dev intltool python \
#     git subversion time unzip zlib1g-dev libssl-dev wget curl cpio bc \
#     gettext gettext-base liblocale-gettext-perl

# RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install \
#     bc curl gcc git libssl-dev libncurses5-dev lzop make u-boot-tools

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install \
    build-essential make binutils bzip2 patch bc sed gzip perl tar cpio python unzip rsync wget file \
    build-essential make binutils bzip2 patch bc sed gzip perl tar cpio python unzip rsync wget bash g++ gcc git locales libncurses5-dev mercurial whois

WORKDIR /src/kernel/
COPY ./ ./
