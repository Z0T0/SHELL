#!/bin/bash
#Maintainer: C.H.
#Function: Make Cert Using CA
#First 2019/6/1 15:28
#Make Private Key
openssl genrsa -out /etc/pki/tls/private/www.ch.com.key 2048
#Make Request
openssl req -new -key /etc/pki/tls/private/www.ch.com.key -out /etc/pki/tls/www.ch.com.csr -days 2048
#Make Certificate
#The real environment , you should copy the www.ch.com.csr to CA server ,and make certificate, then copy to the localhost.
openssl x509 -req -in /etc/pki/tls/www.ch.com.csr -out /etc/pki/tls/www.ch.com.crt -CAkey /etc/pki/CA/private/cakey.pem -CA /etc/pki/CA/cacert.pem -days 365 -CAcreateserial
#import CAcert.pem
cat /etc/pki/CA/cacert.pem >> /etc/pki/tls/certs/ca-bundle.crt
