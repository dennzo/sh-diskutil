# sh-diskutil

ONLY FOR MAC OSX!

Use with caution, as it wipes your disk entirely. :)
You cannot hold me responsible for any data loss or damage that might occur. 


## Requirements
- smartmontools (installable with homebrew - only needed for erase-disk.sh)


## erase-disk.sh - Erasing and resetting a disk
A simple script to quickly wipe all data and create a simple exFAT partition.
Mostly I used this to quickly wipe multiple disks in bulk for example if I want to resell them. 
You can connect multiple disks e.g. via USB to SATA/M.2/IDE Adapters.
The script also dumps technical information and S.M.A.R.T values to a textfile which naming is based on the serial number of the drive (since it is unique).


## overwrite-disk.sh - Wiping Algorithm Script

This takes a long time, so make sure you take this into account!

0 – Single-pass zero-fill erase.
1 – Single-pass random-fill erase.
2 – US DoD 7-pass secure erase.
3 – Gutmann algorithm 35-pass secure erase.
4 – US DoE algorithm 3-pass secure erase.

This should only be used for HDDs, not SSD.
You can read more on why here
https://apple.stackexchange.com/a/258171