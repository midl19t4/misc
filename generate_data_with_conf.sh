#!/bin/bash

WIDTH=224
HEIGHT=224
COUNT=10000
MIN_TC=1
MAX_TC=5
MIN_WC=1
MAX_WC=4
MIN_WL=1
MAX_WL=15
SEED=89989

_PATH=/data/midl19t4/4wc-5tc-15wl

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

~/midlenv/bin/python3 main.py -w $WIDTH -h $HEIGHT -c $COUNT -min_tc $MIN_TC -max_tc $MAX_TC -min_wc $MIN_WC -max_wc $MAX_WC -min_wl $MIN_WL -max_wl $MAX_WL -s $SEED

mkdir -p "$_PATH"
mv image_locations.txt $_PATH
mv bounding_boxes.npy $_PATH
mv images/ $_PATH

