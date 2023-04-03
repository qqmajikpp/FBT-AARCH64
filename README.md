# FBT-AARCH64
This is a setup script that sets up the toolchain for ARM devices, allowing the use of the Flipper Build Tool.
 
### This script
- was created in collaboration with E_Surge
- assumes you are running a Debian variant of Linux
- is designed to run on 64-bit AARCH64 systems
- assumes APT is your package manager

### Usage
Clone this repo or download the script separately to your ARM device, give execute permission to the script, and run.

### What does this script do?
During execution of the setup script, you will be prompted to run a pre-setup script.

This pre-setup script will remove some symlinks from `/usr/bin` including files referencing `arm-none-eabi`.

Additionally, this script will remove the following packages from your system:
- gcc-arm-none-eabi
- libnewlib-arm-none-eabi
- libnewlib-dev
- libstdc++-arm-none-eabi-newlib

Running the pre-setup is optional but with the risk of the packages conflicting with a successful execution of the Flipper Build Tool.

After the pre-setup is complete, the setup script will update your system packages, and install the following packages:
- python3
- python3-dev
- python3-pip
- nanopb
- libprotobuf23
- libprotoc23
- protobuf-compiler

Also, it'll install the following Python modules:
- nanopb == 0.4.7
- protobuf == 3.20.3
- heatshrink2 == 0.12.0
- scons == 4.5.2
- ansi == 0.3.6
- colorlog == 6.7.0
- pillow == 9.4.0

After the packages and Python modules are installed, the script will download the **GNU Arm Embedded GCC v10.3.1-2.1** toolchain from a third-party GitHub repo, available [here](https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack). The toolchain is extracted to `/usr/share/` and symlinks are created in `/usr/bin/`.

Once the script is complete, you can clone the FlipperZero Firmware repo, and run FBT with `FBT_NOENV=1 ./fbt` or use the modified `fbt` from the repo.

When you get your shiny new dist folder, you can find the dfu inside. If you want to use the aarch64 device to flash your Flipper, put your Flipper into DFU mode as outlined in the Flipper Docs, change to the directory where you new dfu is located and run 

Good Luck & Have Fun

Shout outs to E_Surge, the whole RogueMaster Crew, and the Rabbit-Labs Crew


