
diskutil list

echo "Which disk do you want to wipe? (/dev/diskX)"

read -p "Enter the name of the disk: " diskname
diskname=${diskname}

echo "------------ OVERWRITE ALGORITHM ------------";
diskutil secureerase --help
echo "Input -> 0, 1, 2, 3 or 4 - any other input will skip this step."
echo "This is discouraged for SSDs, since every write shortens its lifetime."
read -p "Do you want to use an overwrite algorithm?" algorithm
diskname=${diskname:-no}

if [ "$algorithm" = "0" ] || "$algorithm" = "1" ] || [ "$algorithm" = "2" ] || [ "$algorithm" = "3" || [ "$algorithm" = "4" ]; then
        diskutil secureErase $algorithm $diskname
fi