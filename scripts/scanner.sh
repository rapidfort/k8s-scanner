#!/bin/bash

# this script gets list of images in k8s and send thmes to scanner

set -x
set -e

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"

# install RF tools
curl  https://"$RF_ENDPOINT"/cli/ | bash

# authenticate with RapidFort platform
rflogin

# get list of images to scan
python main.py "$SCRIPTPATH"/image_scan.lst

echo "Images to be scanned"
cat "$SCRIPTPATH"/image_scan.lst

# Begin scanning
rfscan "$SCRIPTPATH"/image_scan.lst
echo "Image scanning completed"
