#!/bin/bash

baseIp="192.167.60"
index=0
for interface in $(ls /sys/class/net); do
	if [ "$interface" != "lo" ] && [ "$interface" != "enp0s8" ]; then
		echo "Configuring $interface"
		ifup $interface
		ifconfig $interface "$baseIp.$index"
		let index=${index}+1
	fi
done
