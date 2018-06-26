#/bin/sh
set -e

# # Clean the exited containers, the untagged images (or old images)
# ( docker rm $( docker ps -a | grep Exit | cut -d ' ' -f 1) || exit 0 )
# ( docker rmi $(docker images | tail -n +2 | awk '$1 == "<none>" {print $'3'}') || exit 0 )

current_path=$(realpath $(dirname "$0"))
source $current_path/include.sh

printf "Step 1: get linux kernel 3.0.8\n"
download_linux_kernel 3.0.8
printf "    Ok\n"
printf "Step 2: get linux kernel 3.18.20\n"
download_linux_kernel 3.18.20
printf "    Ok\n"
printf "Step 3: get linux kernel 3.4.35\n"
download_linux_kernel 3.4.35
printf "    Ok\n"

printf "Step 3: build docker image with kernels\n"
docker build -t kernels_src -f $current_path/kernels_src.Dockerfile $current_path/init_data/
printf "    Ok\n"
