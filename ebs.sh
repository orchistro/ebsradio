#!/bin/bash

ABSPATH_SELF=$(cd $(dirname $0); pwd -P)
if [ $# -ne 2 ];
then
    echo "Usage: $0 filename duration(unit:min)"
    exit 1
fi

FILENAMEROOT=$1
DURATION=$(($2 * 60))

DATE=$(date +"%Y-%m-%d")
WEEKDAY=$(date +"%A")

FILENAME1="${ABSPATH_SELF}/${FILENAMEROOT}-${DATE}.m4a"

EBS_RADIO_URL="rtmp://ebsandroid.ebs.co.kr/fmradiofamilypc/familypc1m"

TMP_WAVFILE="${FILENAME1}.wav"

/Applications/VLC.app/Contents/MacOS/VLC -I dummy ${EBS_RADIO_URL} vlc://quit --no-sout-video --sout-audio --no-sout-rtp-sap --no-sout-standard-sap --ttl=1 --sout-keep --sout "#transcode{acodec=s16l,channels=2}:std{access=file,mux=wav,dst=${TMP_WAVFILE}}" 2> /dev/null &

VLC_PID=$!

sleep ${DURATION}

kill -TERM ${VLC_PID}

sleep 10

/usr/bin/afconvert -f mp4f -d aac -q 127 ${TMP_WAVFILE} ${FILENAME1}
mv ${FILENAME1} /Users/orchistro/Documents/ebs

rm -f ${TMP_WAVFILE}

