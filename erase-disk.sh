#!/bin/bash

diskutil list

echo "Which disk do you want to wipe? (/dev/diskX)"
read -p "Enter the name of the disk: " diskname
diskname=${diskname}

# Disk Erase

echo "------------ ERASING DISK ------------"
diskutil unmountDisk $diskname
gpt destroy $diskname
diskutil eraseDisk ExFAT Untitled $diskname
echo "------------ ERASE COMPLETED ------------"

diskutil list $diskname


# Smart Analysis

echo "------------ SMART ANALYSIS ------------";
smartctl -a $diskname
serialNumber=$(smartctl -a ${diskname} | grep "Serial Number" | awk -F':' '{print $2}' | awk '{ gsub(/ /,""); print }')

echo "------------ DUMPING SMART ANALYSIS TO FILE ------------"
smartctl -a $diskname > ./smart-values/$serialNumber.txt



# Ejecting the device

echo "Do you want to eject? (Default -> yes)?"
read -p "Eject:" eject
eject=${eject:-yes}

if [ "$eject" = "y" ] || [ "$eject" = "Y" ] || [ "$eject" = "yes" ]; then
	echo "------------ DISK EJECTED ------------"
        diskutil unmountDisk $diskname
fi
