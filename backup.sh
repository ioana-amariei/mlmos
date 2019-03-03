#! /bin/bash




date=$(date +"%Y-%m-%u-%H-%M-%S")
fileName=` echo $1 | cut -d. -f1`
fullName="${fileName}-${date}.tar"

echo $date
echo $fileName
echo $fullName

tar -cf ${fullName} $1
