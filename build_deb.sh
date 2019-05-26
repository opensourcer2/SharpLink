#! /bin/bash

randstr=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 8 | head -n 1)
containerid=toxtunnel-build-$randstr
imageid=toxtunnel-build-$(id -u)

(set -xe; docker build -t $imageid .)

set -xe

chmod a+x build_toxtunnel.sh

docker run -it --rm \
    --name $containerid \
    -v "$(dirname $(readlink -f "$0")):/tmp/toxtunnel" \
    $imageid
