#!/bin/bash
#Maintainer: C.H.
#Function: Build CA
#First: 2019/6/1 14:28
yum install -y openssl-devel openssl &> /dev/null
if [ $? -lt 0 ]; then
	echo " install failed "
	exit 127
fi

touch /etc/pki/CA/index.txt
echo 01 > /etc/pki/CA/serial
#Build CA Private Key
(umask 066 ;openssl genrsa -out /etc/pki/CA/private/cakey.pem 2048)
#Build CA Certificate
openssl req -new -x509 -key /etc/pki/CA/private/cakey.pem -out /etc/pki/CA/cacert.pem -days 365 



