# FBT-AARCH64
This is a setup script that sets up the toolchain for ARM devices, allowing the use of the Flipper Build Tool.
 
this script was created in colllaboration with E_Surge.

This script assumes you are running a debian variant of linux and assumes apt is your package manager

To use this script, place the include flipperzero* folder in same directory as the flipperzero* firmware folder so they can merge together. Make sure the folder names match exactly or drop the contents directly into the firmware folder. Overwrite/Replace all files when prompted so you have the modified working versions.

run the setup script to installl the toolchain stuff that fbt normally does for x86 on its first run. Note that while fbt installs the toolchain on every fresh clone, you should only have to run this setup script once for the arm system being used. if you clone a fresh repo, the only thing you should need to do if you have the tools installed is replace fbt.

Run FBT and get a shiny new dist folder with firmware.


Good Luck & Have Fun



shout outs to E_Surge, the whole RogueMaster Crew and the Rabbit-Labs Crew


