#!/bin/bash

set -xeu

_I_TAG='asia-2020'
BASEPATH=$(cd `dirname $0`/ ; pwd)
DIREPATH=`echo $BASEPATH | awk -F\/ '{print $NF}'`

set +eu
docker rm -f ${_I_TAG}
set -eu

docker build . -t ${_I_TAG}

docker run --rm \
           -it \
           -p 4000:4000 \
           -v $BASEPATH:/opt/asia-2020/$DIREPATH \
           -w /opt/asia-2020/$DIREPATH \
           -h ${_I_TAG} \
           --name ${_I_TAG} \
           ${_I_TAG} \
           bundle exec jekyll serve
           # /bin/bash       # for debug
