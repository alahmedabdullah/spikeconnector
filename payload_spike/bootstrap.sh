#!/bin/sh
# version 2.0

yum -y update
yum install -y unzip

WORK_DIR=`pwd`

SPIKE_PACKAGE_NAME=$(sed 's/SPIKE_PACKAGE_NAME=//' $WORK_DIR/package_metadata.txt)
cp $WORK_DIR/$SPIKE_PACKAGE_NAME /opt

cd /opt/
unzip $SPIKE_PACKAGE_NAME
rm $SPIKE_PACKAGE_NAME

cd $WORK_DIR
