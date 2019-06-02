#!/bin/bash
#Maintainer: C.H.
#Function: Make Cert Using CA
#First 2019/6/1 15:28
#Make Private Key
read -p 'Please input your DOMAIN' DOMAIN
openssl genrsa -out /etc/pki/tls/private/${DOMAIN}.key 2048
#Make Request
openssl req -new -key /etc/pki/tls/private/${DOMAIN}.key -out /etc/pki/tls/${DOMAIN}.csr -days 2048
#Make Certificate
#The real environment , you should copy the www.ch.com.csr to CA server ,and make certificate, then copy to the localhost.
openssl x509 -req -in /etc/pki/tls/${DOMAIN}.csr -out /etc/pki/tls/${DOMAIN}.crt -CAkey /etc/pki/CA/private/cakey.pem -CA /etc/pki/CA/cacert.pem -days 365 -CAcreateserial
#import CAcert.pem
cat /etc/pki/CA/cacert.pem >> /etc/pki/tls/certs/ca-bundle.crt
