#!/bin/sh

git submodule init && git submodule update
wget https://dl.google.com/android/repository/android-ndk-r10e-linux-x86_64.zip -o /dev/null
unzip android-ndk-r10e-linux-x86_64.zip
export ANDROID_NDK_HOME=$PWD/android-ndk-r10e/
export NDK_HOME=$PWD/android-ndk-r10e/
./waf --help
./waf configure -T release --android=armeabi-v7a-hard,4.9,21 --togles --build-game=dod --disable-warns &&
./waf build
#git submodule init && git submodule update
#sudo apt-get update
#sudo apt-get install -f -y gdb libopenal-dev g++-multilib gcc-multilib libpng-dev libjpeg-dev libfreetype6-dev libfontconfig1-dev libcurl4-gnutls-dev libsdl2-dev zlib1g-dev libbz2-dev libedit-dev

#./waf configure -T release --disable-warns --tests --prefix=out/ --64bits $* &&
#./waf install &&
#cd out &&
#LD_LIBRARY_PATH=bin/ ./unittest
