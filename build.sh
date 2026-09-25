#!/bin/sh
# usage: ./build.sh [install]

set -e
cd "$(dirname "$0")"
[ -d build ] || meson setup build --prefix /usr
meson compile -C build
echo "built: build/keqingsay"

if [ "$1" = "install" ]; then
    meson configure build --prefix /usr
    sudo meson install -C build
fi
