#!/bin/expect
#Maintainer: C.H.
#Description: Push local public key to other hosts
#First 2019/6/3 8:33
set REMOTE_HOST [lindex $argv 0]
set PASSWORD [lindex $argv 1]
spawn ssh-copy-id -i ${REMOTE_HOST}
#expect "Are you sure you want to continue connecting (yes/no)?"
#send "yes\n"
#echo "root@${REMOTE_HOST}'s password:"
expect "root@${REMOTE_HOST}'s password:"
send "${PASSWORD}\n"
