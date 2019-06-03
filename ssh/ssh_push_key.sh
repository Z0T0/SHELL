#!/bin/bash
#Maintainer: C.H.
#First: 2019/6/3 11:24
#Function: Push public key to other hosts
while :
do
	read -p "Please input remote host IP:" REMOTE_HOST
#	read -s "Please input remote host password:" REMOTE_HOST_PASSWORD
        if [[ $REMOTE_HOST =~ ^([0-9]{1,2}|1[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{1,2}|2[0-4][0-9]|25[0-5])$ ]];then
		read -s -p "Please input remote host password:" REMOTE_HOST_PASSWORD	
		if [ -n $REMOTE_HOST_PASSWORD ];then
			/root/ssh_push_key_autoanswer.sh ${REMOTE_HOST} ${REMOTE_HOST_PASSWORD}
			if [ $? -gt 0 ];then
				echo "The remote host password have a problem"
			fi
		fi
	else
		echo "The remote host ip have a problem ${REMOTE_HOST}. Usage:'10.10.10.10' "	
	fi
	
done

