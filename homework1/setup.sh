#!/bin/bash

cp bootstrap.service preboot.sh preboot.properties /etc/systemd/system
cp bootstrap.sh bootstrap.properties /root/repositories/mlmos/homework1

systemctl daemon-reload
systemctl restart bootstrap.service

