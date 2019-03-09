#!/bin/bash

function log() {
	echo "$1" >> '/var/log/system-bootstrap.log'
}

log "Starting the host configuration process"

log "Updating all packages"
yum update -y

selinux=$(grep "^SELINUX=" '/etc/selinux/config' | cut -d'=' -f2) 
if [ "$selinux" == "disabled" ]; then
	log "SELINUX is disabled; running setenforce 0"
	setenforce 0
else
	log "SELINXU is not disbled; current value: $selinux"
fi


log "Configuring the network intefaces"
baseIp="192.167.60"
index=0
for interface in $(ls /sys/class/net); do
        if [ "$interface" != "lo" ] && [ "$interface" != "enp0s8" ]; then
                log "Configuring $interface"
                ifup $interface
                ifconfig $interface "$baseIp.$index"
                let index=${index}+1
        fi
done


log "Configuring ssh authentication"
sshConfig='/etc/ssh/sshd_config'
echo "PubkeyAuthentication yes" >> $sshConfig
echo "AuthorizedKeyFile /etc/ssh/authorized_keys" >> $sshConfig
echo "PasswordAuthentication no" >> $sshConfig
echo "ChallengeResponseAuthentication no" >> $sshConfig

cp /root/repositories/mlmos/homework1/authorized_keys /etc/ssh/
chmod 600 /etc/ssh/authorized_keys

systemctl restart sshd.service
log "Finished configuring ssh authentication"

log "The host is configured"
