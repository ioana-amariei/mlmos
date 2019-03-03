#!/bin/bash

ls -l $1 > file1
ls -l $2 > file2

diff file1 file2

if [[ $? -eq "0" ]] 
then
	echo "Identical directories"
fi


