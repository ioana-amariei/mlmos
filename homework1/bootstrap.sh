#!/bin/bash

logs=/var/log/system-bootstrap.log

echo "Hello World!" >> $logs

file=/etc/selinux/config
selinux=$(grep "^SELINUX=" $file | cut -d'=' -f2) 

if [[ "$selinux" == "disabled" ]]; then
	echo "SELINUX is disabled; running setenforce 0" >> $logs
	setenforce 0
else
	echo "SELINXU is not disbled; current value: $selinux"
fi

