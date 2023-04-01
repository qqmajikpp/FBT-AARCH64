#!/bin/sh

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

echo "######################################"
echo "##### Remove old toolchain links #####"
echo "######################################"
sudo apt remove gcc-arm-none-eabi
sudo rm -rf /usr/bin/arm-none-eabi*
sudo rm -rf /usr/share/gcc-arm-none-eabi-10.3-2021.10
echo "################################"
echo "##### APT Update + Upgrade #####"
echo "################################"
sudo apt update && sudo apt upgrade
echo "#########################################"
echo "##### APT Install Required Packages #####"
echo "#########################################"
sudo apt -y install binutils-arm-none-eabi libnewlib-arm-none-eabi libnewlib-dev libstdc++-arm-none-eabi-newlib python3 python3-dev
echo "###################################################"
echo "##### Python PIP Install of Required Packages #####"
echo "###################################################"
pip3 install --upgrade pip
pip3 install -r requirements.txt
echo "########################################################################################"
echo "##### Downloading GCC Toolchain specific for FlipperZero Firmware as of April 2023 #####"
echo "########################################################################################"
wget -P $HOME/Downloads/ -O gcc-arm-none-eabi-10.3-2021.10-aarch64-linux-tar.bz2 "https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-aarch64-linux.tar.bz2?rev=b748c39178c043b4915b04645d7774d8&hash=572217C8AFE83F1010753EA3E3A7EC2307DADD58"
echo "###############################"
echo "##### Extracting tar file #####"
echo "###############################"
sudo tar xjf $HOME/Downloads/gcc-arm-none-eabi-10.3-2021.10-aarch64-linux-tar.bz2 -C /usr/share/
echo "############################################"
echo "##### Extracting done, adding symlinks #####"
echo "############################################"
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-addr2line /usr/bin/arm-none-eabi-addr2line
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-ar /usr/bin/arm-none-eabi-ar
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-as /usr/bin/arm-none-eabi-as
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-c++ /usr/bin/arm-none-eabi-c++
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-c++filt /usr/bin/arm-none-eabi-c++filt
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-cpp /usr/bin/arm-none-eabi-cpp
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-elfedit /usr/bin/arm-none-eabi-elfedit
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-g++ /usr/bin/arm-none-eabi-g++
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc /usr/bin/arm-none-eabi-gcc
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc-10.3.1 /usr/bin/arm-none-eabi-gcc-10.3.1
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc-ar /usr/bin/arm-none-eabi-gcc-ar
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc-nm /usr/bin/arm-none-eabi-gcc-nm
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc-ranlib /usr/bin/arm-none-eabi-gcc-ranlib
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcov /usr/bin/arm-none-eabi-gcov
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcov-dump /usr/bin/arm-none-eabi-gcov-dump
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcov-tool /usr/bin/arm-none-eabi-gcov-tool
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gdb /usr/bin/arm-none-eabi-gdb
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gdb-add-index /usr/bin/arm-none-eabi-gdb-add-index
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gdb-add-index-py /usr/bin/arm-none-eabi-gdb-add-index-py
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gdb-py /usr/bin/arm-none-eabi-gdb-py
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gprof /usr/bin/arm-none-eabi-gprof
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-ld /usr/bin/arm-none-eabi-ld
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-ld.bfd /usr/bin/arm-none-eabi-ld.bfd
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-lto-dump /usr/bin/arm-none-eabi-lto-dump
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-nm /usr/bin/arm-none-eabi-nm
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-objcopy /usr/bin/arm-none-eabi-objcopy
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-objdump /usr/bin/arm-none-eabi-objdump
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-ranlib /usr/bin/arm-none-eabi-ranlib
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-readelf /usr/bin/arm-none-eabi-readelf
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-size /usr/bin/arm-none-eabi-size
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-strings /usr/bin/arm-none-eabi-strings
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-strip /usr/bin/arm-none-eabi-strip
echo "#########################################################################"
echo "##### Done. Clone FlipperZero Firmware and Run FBT with FBT_NOENV=1 #####"
echo "#########################################################################"