#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=$(pwd)/arm-eabi-ubertc_7.0-2016.04/bin/arm-eabi-

mkdir output

# Cyanogenmod / LineageOS Kernel
make -C $(pwd) O=output cm_msm8974_sec_defconfig VARIANT_DEFCONFIG=msm8974_sec_ks01_skt_defconfig SELINUX_DEFCONFIG=selinux_defconfig
make -j64 -C $(pwd) O=output

cp output/arch/arm/boot/zImage $(pwd)/gugu0das/Cyanogenmod_14.1/kernel

# Make Boot.img
./gugu0das/mkboot.sh
