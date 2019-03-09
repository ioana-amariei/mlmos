#!/bin/bash

logs='/var/log/system-bootstrap.log'

#function getConfigValueFor() {
#	echo $(jq -r ".$1" /etc/systemd/system/preboot.json)
#}

function getConfigValueFor() {
	echo $(grep "$1=" /etc/systemd/system/preboot.properties | cut -d'=' -f2)
}

if [ ! -f '/etc/systemd/system/preboot.properties' ]; then
	echo "The configuration file is not present" >> $logs
	exit
fi 

hostname=$(getConfigValueFor 'hostname')
if [[ "$hostname" != "null" ]]; then
	echo "Setting the hostname to: $hostname" >> $logs
	hostnamectl set-hostname "$hostname"
fi

device=$(getConfigValueFor 'device')
if [[ "$device" != "null" ]]; then
	echo "Starting the network interface: $device" >> $logs
	ifup $device
fi


# Install repository for jq
#yum install -y epel-release

# Install the jq utility for parsing configuration files in json format
#yum install -y jq

yum install git

echo "Cloning the repository" >> $logs
#cd /root/repositories 
#rm -rf mlmos
#git clone https://github.com/ioanabirsan/mlmos.git
