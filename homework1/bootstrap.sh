#!/bin/bash

function getConfigValueFor() {
        echo $(grep "$1=" /root/repositories/mlmos/homework1/bootstrap.properties | cut -d'=' -f2)
}

logs=$(getConfigValueFor 'logs')
function log() {
	echo "$1" >> $logs
}

log "Starting the host configuration process"

log "Updating all packages"
yum update -y

log "Installing required software packages"
requiredSoftwarePackages=$(getConfigValueFor 'requiredSoftwarePackages')
for package in $requiredSoftwarePackages; do
	log "Installing $package"
	yum install -y $package
done

selinuxConfigFile=$(getConfigValueFor 'selinuxConfigFile')
selinux=$(grep "^SELINUX=" "$selinuxConfigFile" | cut -d'=' -f2) 
if [ "$selinux" == "disabled" ]; then
	log "SELINUX is disabled; nothing to do"
else
        log "Disabling SELINUX"
        sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
fi

log "Configuring setenforce 0"
setenforce 0

log "Configuring the network intefaces"
baseIp=$(getConfigValueFor 'baseIp')
index=0
for interface in $(ls /sys/class/net); do
        if [ "$interface" != "lo" ] && [ "$interface" != "enp0s8" ]; then
                log "Configuring $interface"
                ifup $interface
                #ifconfig $interface "$baseIp.$index"
                let index=${index}+1
        fi
done


log "Configuring ssh authentication"
sshConfigFile=$(getConfigValueFor 'sshConfigFile')

sed -i 's/^PubkeyAuthentication.*//' $sshConfigFile
sed -i 's/^AuthorizedKeysFile.*//' $sshConfigFile
sed -i 's/^PasswordAuthentication.*//' $sshConfigFile
sed -i 's/^ChallengeResponseAuthentication.*//' $sshConfigFile
sed -i 's/^RSAAuthentication.*//' $sshConfigFile


echo "PubkeyAuthentication yes" >> $sshConfigFile
echo "AuthorizedKeysFile ~/.ssh/authorized_keys" >> $sshConfigFile
echo "PasswordAuthentication no" >> $sshConfigFile
echo "ChallengeResponseAuthentication no" >> $sshConfigFile
echo "RSAAuthentication yes" >> $sshConfigFile

mkdir -p ~/.ssh
cp /root/repositories/mlmos/homework1/authorized_keys ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

systemctl restart sshd
log "Finished configuring ssh authentication"

log "The host is configured"
