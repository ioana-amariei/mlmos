#! /bin/bash

# find all previous archived backups
nrOfBackupFiles=$(ls | awk '/file-[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}-.*.tar/ { print }' | wc -l)

if [ $nrOfBackupFiles -gt 3 ]; then
	oldestBackup=$(ls -tr | awk '/file-[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}-.*.tar/ { print }' | head -1
)
	rm $oldestBackup
fi	

date=$(date +"%Y-%m-%u-%H-%M-%S")
fileName=` echo $1 | cut -d. -f1`
fullName="${fileName}-${date}.tar"

echo $date
echo $fileName
echo $fullName

tar -cf ${fullName} $1

