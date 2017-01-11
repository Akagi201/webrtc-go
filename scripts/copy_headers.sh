#!/usr/bin/env bash

WEBRTC_DIR="$HOME/Documents/webrtc-checkout/src"
INCLUDE_DIR="../webrtc/webrtc/include"

pushd `dirname $0` > /dev/null
PWD=`pwd`
popd > /dev/null

INCLUDE_DIR=$PWD/$INCLUDE_DIR

echo "Start copying header files..."

pushd $WEBRTC_DIR || exit 1
rm -rf "$INCLUDE_DIR"
for h in $(find webrtc/ -type f -name '*.h')
do
    mkdir -p "$INCLUDE_DIR/$(dirname $h)"
    cp $h "$INCLUDE_DIR/$h"
done
popd

echo "Finish copying header files"

