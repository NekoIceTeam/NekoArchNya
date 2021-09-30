#!/bin/bash
# Your Only Can Build On Arch Based System

BUILD_DIR='icelinux_x86_64/build'
OUT_DIR='icelinux_x86_64/out'
clear
echo "===================================
       IceLinux Build Script       
===================================
- Arch : x86_64
- Building Date : $(date +%Y.%m.%d)
- Script Version : v1.0

<https://github.com/NekoIceTeam/IceLinux>
  Copyright (c) 2021 NekoIceCream  
===================================

       Warning Before Building
- Building Only Work On Arch Based System
- It's Take 4GB+ For Download Packages
- Need good Internet Connection

Starting Building...
Ctrl + For Cancel"
sleep 10

if [ -d $OUT_DIR ]
then
sleep 1
else
mkdir $OUT_DIR
fi

if [ -d $BUILD_DIR ]
then
sleep 1
else
mkdir $BUILD_DIR
fi

sudo pacman -Syyyu --noconfirm
sudo pacman -S archiso --noconfirm
mkarchiso -v -g 8E02DA8285638FD2 -G nekoicecream@outlook.co.id -w $BUILD_DIR -o $OUT_DIR icelinux_x86_64/
#mkarchiso -v -G nekoicecream@outlook.co.id -w $BUILD_DIR -o $OUT_DIR icelinux_x86_64
# Copyright (c) 2021 NekoIceCream