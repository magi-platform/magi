#!/bin/bash

ROOT_DIR=$(pwd)
cd $ROOT_DIR

HAS_HADOOP=$(ls $ROOT_DIR/distro | grep hadoop)
HAS_HBASE=$(ls $ROOT_DIR/distro | grep hbase)

if [ -z $HAS_HADOOP ]; then
    echo "downloading hadoop-2.7.7"
    cd $ROOT_DIR/distro
    curl -L -O https://archive.apache.org/dist/hadoop/common/hadoop-2.7.7/hadoop-2.7.7.tar.gz
fi

if [ -z $HAS_HBASE ]; then
    echo "download hbase-2.1.5"
    cd $ROOT_DIR/distro
    curl -L -O http://archive.apache.org/dist/hbase/2.1.5/hbase-2.1.5-bin.tar.gz
fi

cd $ROOT_DIR