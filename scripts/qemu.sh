#!/bin/bash

BIN=../bin
BOOT=$BIN/$1.bin

MEM=4M # minimum - 1009kb of ram

qemu-system-x86_64 \
-drive format=raw,file=$BOOT \
-audiodev pa,id=snd0 -machine pcspk-audiodev=snd0 \
-m $MEM \
-enable-kvm