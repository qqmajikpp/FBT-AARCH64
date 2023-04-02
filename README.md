# FBT-AARCH64
This is a setup script that sets up the toolchain for ARM devices, allowing the use of the Flipper Build Tool.
 
this script was created in colllaboration with E_Surge.

This script assumes you are running a debian variant of linux and assumes apt is your package manager

run the setup script to installl the toolchain stuff that fbt normally does for x86 on its first run. Note that while fbt installs the toolchain on every fresh clone, you should only have to run this setup script once for the arm system being used.

you have to also either set at run, or edit fbt with: FBT_NOENV=1

Run FBT and get a shiny new dist folder with firmware.

you can flash the dfu via usb by putting yout flip in dfu mode and running:
dfu-util -D (firmware name here).dfu -a 0


Good Luck & Have Fun



shout outs to E_Surge, the whole RogueMaster Crew and the Rabbit-Labs Crew


