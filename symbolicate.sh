#!/usr/bin/bash

#
export DEVELOPER_DIR="/Applications/xCode.app/Contents/Developer"

# Assuming that symbolicatecrash file is available in below path, update path base on your xcode version
# For Xcode 7.3 to 9.x : /Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/symbolicatecrash
# For Xcode 6 to 7.2: /Applications/Xcode.app/Contents/SharedFrameworks/DTDeviceKitBase.framework/Versions/Current/Resources/symbolicatecrash
# For Xcode 5: /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/PrivateFrameworks/DTDeviceKitBase.framework/Versions/Current/Resources/symbolicatecrash
# use "find /Applications/xCode.app -name symbolicatecrash -type f" to get exact path in your xcode version

alias symbolicatecrash='/Applications/xCode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/symbolicatecrash'

for crashFile in *.crash;
do
fileNo=1
prev=$fileNo
for dysmFile in *.dSYM;
do
    if [ $fileNo == 1 ]
    then
    symbolicatecrash $crashFile $dysmFile > "symbolicated_${fileNo}_${crashFile}"
    else
    prev=$((fileNo-1))
    symbolicatecrash "symbolicated_${prev}_${crashFile}" $dysmFile > "symbolicated_${fileNo}_${crashFile}"
    rm "symbolicated_${prev}_${crashFile}"
    fi
    fileNo=$((fileNo+1))
done
done