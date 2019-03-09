#!/bin/bash

cp bootstrap.service preboot.sh preboot.properties /etc/systemd/system

# Comment this line when runnig for real
cp bootstrap.sh bootstrap.properties authorized_keys /root/repositories/mlmos/homework1

systemctl daemon-reload
systemctl restart bootstrap.service

