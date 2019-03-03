#! /bin/bash

file=$1

host=$(cut -d, -f1 $file)
ip=$(cut -d, -f2 $file)
web=$(cut -d, -f3 $file)
backend=$(cut -d, -f4 $file)
database=$(cut -d, -f5 $file)


echo "Host: ${host}"
echo "IP: ${ip}"
echo "Web: ${web}"
echo "Backend: ${backend}"
echo "Database: ${database}"
