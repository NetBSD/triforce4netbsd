#!/bin/sh
#
# build triforce patched qemu for AFL
#

cd qemu

CFLAGS="-O3" ./configure --disable-werror \
  --enable-system --disable-linux-user --disable-bsd-user \
  --enable-guest-base --disable-gtk --disable-sdl --disable-vnc \
  --target-list="x86_64-softmmu arm-softmmu aarch64-softmmu"

make
cp -f "x86_64-softmmu/qemu-system-x86_64" "../../afl-qemu-system-trace"
cp -f "x86_64-softmmu/qemu-system-x86_64" "../../qemu-system-x86_64"
cp -f "arm-softmmu/qemu-system-arm" "../../qemu-system-arm"
cp -f "aarch64-softmmu/qemu-system-aarch64" "../../qemu-system-aarch64"
