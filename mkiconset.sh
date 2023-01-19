#!/bin/bash
#this script will create an icns file for macos programs
read -p "Supply iconset name:" ICS
mkdir "${ICS}.iconset"
read -p "Starting ICON (should be 1024 in size):" START
if [ -f ${START} ]
then
	sips -z 16 16     "${START}" --out "${ICS}.iconset"/icon_16x16.png
	sips -z 32 32     "${START}" --out "${ICS}.iconset"/icon_16x16@2x.png
	sips -z 32 32     "${START}" --out "${ICS}.iconset"/icon_32x32.png
	sips -z 64 64     "${START}" --out "${ICS}.iconset"/icon_32x32@2x.png
	sips -z 128 128   "${START}" --out "${ICS}.iconset"/icon_128x128.png
	sips -z 256 256   "${START}" --out "${ICS}.iconset"/icon_128x128@2x.png
	sips -z 256 256   "${START}" --out "${ICS}.iconset"/icon_256x256.png
	sips -z 512 512   "${START}" --out "${ICS}.iconset"/icon_256x256@2x.png
	sips -z 512 512   "${START}" --out "${ICS}.iconset"/icon_512x512.png
	cp "${START}" "${ICS}.iconset"/icon_512x512@2x.png
	iconutil -c icns "${ICS}.iconset"
else
	echo "Icon does not exist"
fi
