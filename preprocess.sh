#!/bin/bash

echo "configure build output path"

KERNEL_TOP_PATH="$( cd "$(dirname "$0")" ; pwd -P)"
OUTPUT="$KERNEL_TOP_PATH/out"
echo $OUTPUT

KERNEL=kernel7l
BUILD_LOG="$KERNEL_TOP_PATH/rpi_pre_process_log.txt"

PREPROCESS_FILE=$1
echo "build preprocess file: $PREPROCESS_FILE"

cd linux

echo "Make defconfig"

make O=$OUTPUT bcm2711_defconfig

echo "kernel build"
make $PREPROCESS_FILE O=$OUTPUT zImage modules dtbs -j4 2>&1 | tee $BUILD_LOG
