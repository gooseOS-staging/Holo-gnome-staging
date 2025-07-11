#Bootable USB Maker for ALG
#!/bin/bash
#set -e
#=================================================================================
#Author: DemonKiller, further modifications will be applied by GooseDev72
#SPDX-License-Identifier: GPL-3.0
#=================================================================================
#Warning: Insert One USB at a time only. If you have any other USB either remove them from the system or change the script accordingly. Check size with lsblk (uncommment line 10 & 11).


echo "=============================================="
echo "Please wait, making gooseOS bootable USB drive"
echo "=============================================="

#echo "Printing Partitions in Drive:" 
#lsblk

echo "unmounting drive..."
umount /dev/sdb*

echo "Checking for any mounted partitions & unmounting them...."
umount /dev/sdb*

echo "========================================================="
echo "Formatting with ext4.."
yes | sudo mkfs.ext4 /dev/sdb

echo "USB is Formatted.."

echo "                               "
echo "================================================================"
echo "Making gooseOS bootable USB, speed accords to your pendrive..."
cd out
sudo dd if=gooseOS-PureGnome-$(date +%Y.%m)-x86_64.iso of=/dev/sdb bs=2048 status='progress'


echo "DONE! Your USB should be bootable now, with gooseOS."
echo "Thank YOU for making pendrive with our distro!"
