#!/bin/bash

#function getConfigValueFor() {
#	echo $(jq -r ".$1" bootstrap-service-config.json)
#}

function getConfigValueFor() {
	echo $(grep "$1=" bootstrap-service-config.properties | cut -d'=' -f2)
}

if [[ ! -f bootstrap-service-config.json ]]; then
	echo "The configuration file is not present"
	return -1 
fi 

hostname=$(getConfigValueFor 'hostname')
if [[ "$hostname" != "null" ]]; then
	echo "Setting the hostname to: $hostname"
	hostnamectl set-hostname "$hostname"
fi

device=$(getConfigValueFor 'device')
if [[ "$device" != "null" ]]; then
	echo "Starting the network interface: $device"
	ifup $device
fi


# Install repository for jq
#yum install -y epel-release

# Install the jq utility for parsing configuration files in json format
#yum install -y jq

yum install git

git clone https://github.com/ioanabirsan/mlmos.git
