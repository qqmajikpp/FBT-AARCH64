#!/bin/bash

######################################################
# This script was created by ??MajiK?? aka qqmajikpp #
# and ESurge to facilitate geting your               #
# AARCH64 system ready to compile with FBT           #
# aka the Flipper Build Tool                         #
#                                                    #
# NOTE: DO NOT forget to set FBT_NOENV=1 in          #
# the environment. Otherwise edit fbt                #
# or use a premodifed fbt                            #
######################################################

echo "#################################################################"
echo "#####  This script will remove some symlinks from /usr/bin  #####"
echo "#####  including files referencing arm-none-eabi. Also,     #####"
echo "#####  this script will remove the following packages:      #####"
echo "#####                                                       #####"
echo "#####  gcc-arm-none-eabi, libnewlib-arm-none-eabi           #####"
echo "#####  libnewlib-dev, libstdc++-arm-none-eabi-newlib        #####"
echo "#################################################################"
echo .
echo .
echo "#############################"
echo "##### Removing Packages #####"
echo "#############################"
sudo apt remove gcc-arm-none-eabi libnewlib-arm-none-eabi libnewlib-dev libstdc++-arm-none-eabi-newlib
echo "###########################################"
echo "##### Removing Symlinks from /usr/bin #####"
echo "###########################################"
sudo rm /usr/bin/arm-none-eabi*
echo .