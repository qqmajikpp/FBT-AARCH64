#!/bin/sh

######################################################
# this script was created by ??MajiK?? aka qqmajikpp #
# to facilitate geting your system ready to compile  #
# with FBT or the Flipper Build Tool                 #
# ***NOTE***  DO NOT forget to set NO_ENV=1 in fbt   #
#             or otherwise use a premodifed fbt      #
######################################################

sudo apt update && sudo apt upgrade
sudo apt -y install binutils-arm-none-eabi gcc-arm-none-eabi libnewlib-arm-none-eabi libnewlib-dev libstdc++-arm-none-eabi-newlib
sudo apt -y install python3 python3-dev
sudo apt -y install protobuf-compiler nanopb
pip3 install heatshrink2
pip3 install scons
pip3 install ansi
pip3 install colorlog
pip3 install pillow
echo
echo
echo ----------------- ALL DONE! --------------------
echo
echo .  If you see no errors and evrything has been  .
echo satisfied and up to date then proceed to run fbt.
echo
echo Good Luck and Have Fun