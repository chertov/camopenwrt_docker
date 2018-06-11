FROM debian:jessie

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install \
    build-essential gawk libncurses-dev python \
    git subversion time unzip zlib1g-dev libssl-dev wget curl cpio bc \
    gettext gettext-base liblocale-gettext-perl

WORKDIR /src/chaos_calmer
COPY ./ ./
