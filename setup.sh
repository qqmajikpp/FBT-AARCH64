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

if [[ "$(uname -m)" == "aarch64" ]]
then
	echo "########################################################"
	echo "#####  This script will prep your system for use   #####"
	echo "#####  with FlipperZero's Flipper Build Tool (FBT) #####"
	echo "########################################################"
	echo 
	echo "#####################################################"
	echo "#####  This script uses the aptitude (apt)      #####"
	echo "#####  package manager as well as Python3 PIP.  #####"
	echo "#####################################################"
	echo 
	echo "#################################################"
	echo "#####  It is recommended that you run the   #####"
	echo "#####  pre-setup script before continuing.  #####"
	echo "#####                                       #####"
	echo "#####  Generally the pre-setup script is    #####"
	echo "#####  not necessary for fresh systems.     #####"
	echo "#################################################"
	echo 
	echo 
	echo 
	echo "#####################################################"
	echo "#####################################################"
	echo "#####  !!! WARNING !!! WARNING !!! WARNING !!!  #####"
	echo "#####################################################"
	echo "#####################################################"
	echo 
	echo "###################################################"
	echo "#####  The pre-setup script WILL REMOVE some  #####"
	echo "#####  files and packages from your system    #####"
	echo "#####  as they may cause conflicts with FBT.  #####"
	echo "###################################################"
	echo 

	while true; do
		read -p "Do you wish to run the pre-setup script now? (Y/N) " yn
		case $yn in
			[Yy]* ) echo 
					echo "#################################################################"
					echo "#####  This script will remove some symlinks from /usr/bin  #####"
					echo "#####  including files referencing arm-none-eabi. Also,     #####"
					echo "#####  this script will remove the following packages:      #####"
					echo "#####                                                       #####"
					echo "#####  gcc-arm-none-eabi, libnewlib-arm-none-eabi           #####"
					echo "#####  libnewlib-dev, libstdc++-arm-none-eabi-newlib        #####"
					echo "#################################################################"
					echo 
					echo 
					echo "#############################"
					echo "##### Removing Packages #####"
					echo "#############################"
					sudo apt remove gcc-arm-none-eabi libnewlib-arm-none-eabi libnewlib-dev libstdc++-arm-none-eabi-newlib
					echo "###########################################"
					echo "##### Removing Symlinks from /usr/bin #####"
					echo "###########################################"
					sudo rm /usr/bin/arm-none-eabi*
					echo 
					break ;;
			[Nn]* ) echo 
					echo "##############################"
					echo "##### Skipping Pre-Setup #####"
					echo "##############################"
					echo 
					break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done

	echo "#########################################"
	echo "##### Continuing with Setup Script  #####"
	echo "#########################################"
	echo 
	echo "###########################################"
	echo "##### APT Update and Upgrade Packages #####"
	echo "###########################################"
	sudo apt update && sudo apt upgrade
	echo "#########################################"
	echo "##### APT Install Required Packages #####"
	echo "#########################################"
	sudo apt -y install python3 python3-dev python3-pip nanopb libprotobuf23 libprotoc23 protobuf-compiler
	echo "###################################################"
	echo "##### Python PIP Install of Required Packages #####"
	echo "###################################################"
	pip install --upgrade pip
	pip install nanopb==0.4.7 protobuf==3.20.3 heatshrink2==0.12.0 scons==4.5.2 ansi==0.3.6 colorlog==6.7.0 pillow==9.4.0
	pip install pyelftools
 	echo "########################################################################################"
	echo "##### Downloading GCC Toolchain specific for FlipperZero Firmware as of April 2023 #####"
	echo "########################################################################################"
	wget -P $HOME/Downloads/ "https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v10.3.1-2.1/xpack-arm-none-eabi-gcc-10.3.1-2.1-linux-arm64.tar.gz"
	echo "###############################"
	echo "##### Extracting tar file #####"
	echo "###############################"
	sudo tar xf $HOME/Downloads/xpack-arm-none-eabi-gcc-10.3.1-2.1-linux-arm64.tar.gz -C /usr/share/
	echo "############################################"
	echo "##### Extracting done, adding symlinks #####"
	echo "############################################"
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-addr2line /usr/bin/arm-none-eabi-addr2line
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-ar /usr/bin/arm-none-eabi-ar
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-as /usr/bin/arm-none-eabi-as
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-c++ /usr/bin/arm-none-eabi-c++
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-c++filt /usr/bin/arm-none-eabi-c++filt
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-cpp /usr/bin/arm-none-eabi-cpp
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-elfedit /usr/bin/arm-none-eabi-elfedit
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-g++ /usr/bin/arm-none-eabi-g++
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-gcc /usr/bin/arm-none-eabi-gcc
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-gcc-10.3.1 /usr/bin/arm-none-eabi-gcc-10.3.1
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-gcc-ar /usr/bin/arm-none-eabi-gcc-ar
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-gcc-nm /usr/bin/arm-none-eabi-gcc-nm
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-gcc-ranlib /usr/bin/arm-none-eabi-gcc-ranlib
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-gcov /usr/bin/arm-none-eabi-gcov
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-gcov-dump /usr/bin/arm-none-eabi-gcov-dump
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-gcov-tool /usr/bin/arm-none-eabi-gcov-tool
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-gdb /usr/bin/arm-none-eabi-gdb
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-gdb-add-index /usr/bin/arm-none-eabi-gdb-add-index
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-gdb-add-index-py3 /usr/bin/arm-none-eabi-gdb-add-index-py3
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-gdb-py3 /usr/bin/arm-none-eabi-gdb-py3
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-gprof /usr/bin/arm-none-eabi-gprof
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-ld /usr/bin/arm-none-eabi-ld
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-ld.bfd /usr/bin/arm-none-eabi-ld.bfd
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-lto-dump /usr/bin/arm-none-eabi-lto-dump
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-nm /usr/bin/arm-none-eabi-nm
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-objcopy /usr/bin/arm-none-eabi-objcopy
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-objdump /usr/bin/arm-none-eabi-objdump
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-ranlib /usr/bin/arm-none-eabi-ranlib
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-readelf /usr/bin/arm-none-eabi-readelf
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-size /usr/bin/arm-none-eabi-size
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-strings /usr/bin/arm-none-eabi-strings
	sudo ln -s /usr/share/xpack-arm-none-eabi-gcc-10.3.1-2.1/bin/arm-none-eabi-strip /usr/bin/arm-none-eabi-strip
	echo "#########################################################################"
	echo "##### Done. Clone FlipperZero Firmware and Run FBT with FBT_NOENV=1 #####"
	echo "#########################################################################"
else
	echo "This script is only for 64-bit systems (AARCH64)."
fi
