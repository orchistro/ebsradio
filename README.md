# Recording EBS radio broadcast

https://orchistro.tistory.com/264

## Recording

First, you need to install VLC on your Mac:

http://www.videolan.org/vlc/

Executing following command will record the live streaming audio from ebs radio into `1.wav`:

```bash
/Applications/VLC.app/Contents/MacOS/VLC -I dummy rtmp://ebsandroid.ebs.co.kr/fmradiofamilypc/familypc1m vlc://quit --no-sout-video --sout-audio --no-sout-rtp-sap --no-sout-standard-sap --ttl=1 --sout-keep --sout "#transcode{acodec=s16l,channels=2}:std{access=file,mux=wav,dst=1.wav}" 2> /dev/null
```

### EBS streaming rtmp address list

rtmp://ebsandroid.nefficient.com/groundwavefamilypc/familypc1m"; // 지상파 HD
rtmp://ebsandroid.nefficient.com/ebsufamilypc/familypc1m"; //EBSu HD
rtmp://ebsandroid.nefficient.com/fmradiofamilypc/familypc1m"; //FM 라디오 SD
rtmp://ebsandroid.nefficient.com/plus1familypc/familypc1m"; //Plus1 SD
rtmp://ebsandroid.nefficient.com/plus2familypc/familypc1m"; //Plus2 SD
rtmp://ebsandroid.nefficient.com/plus3familypc/familypc1m"; //Plus3 SD


## Converting .wav to .m4a

```bash
/usr/bin/afconvert -f mp4f -d aac -q 127 1.wav 1.m4a
```

Why not let vlc directly save output in mp3 format?

Because, the sound quality is not quite good. It left me with no choice but to record using wav format and then convert it to aac format.

## Making your mac to automatically record the live stream
