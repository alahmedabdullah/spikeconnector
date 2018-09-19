#!/bin/sh

INPUT_DIR=$1
OUTPUT_DIR=$2

spike_exe=$(find /opt -name 'spike-*' 2>&1)

cd $INPUT_DIR

$spike_exe $(cat cli_parameters.txt) &> runlog.txt


cp ./*.txt ../$OUTPUT_DIR
cp ./*.csv ../$OUTPUT_DIR

# --- EOF ---
