#!/bin/bash

diskutil list

echo "Which disk do you want to wipe? (Default -> /dev/disk2)"

read -p "Enter the name of the disk: " diskname
diskname=${diskname:-/dev/disk2}

diskutil unmountDisk $diskname
gpt destroy $diskname
diskutil eraseDisk ExFAT Untitled $diskname
echo "------------ ERASE COMPLETED ------------"
diskutil list $diskname

echo "Do you want to eject? (Default -> yes)?"

read -p "Eject:" eject
eject=${eject:-yes}

if [ "$eject" = "y" ] || [ "$eject" = "Y" ] || [ "$eject" = "yes" ]; then
	echo "------------ DISK EJECTED ------------"
        diskutil unmountDisk $diskname
fi
