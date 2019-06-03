#!/bin/expect
#Maintainer: C.H
#Function: execute mysql_secure_install, default disallow root login.
set OLD_PASSWORD [lindex $argv 0]
set NEW_PASSWORD [lindex $argv 1]
set ANONYMOUS [lindex $argv 2]
set TEST [lindex $argv 3]
spawn mysql_secure_installation
expect "Enter current password for root (enter for none):"
#---------------
#You have mariadb-server password
send "${OLD_PASSWORD}\n"
expect "Change the root password?"
send "Y\n"
#----------------
# first install mairadb-server AND init mairadb-server
#send "\n"
#expect "Set root password?"
#send "Y\n"
#----------------
expect "New password:"
send "${NEW_PASSWORD}\n"
expect "Re-enter new password:"
send "${NEW_PASSWORD}\n"
expect "Remove anonymous users?"
send "${ANONYMOUS}\n"
expect "Disallow root login remotely?"
send "Y\n"
expect "Remove test database and access to it?"
send "${TEST}\n"
expect "Reload privilege tables now?"
send "Y\n"
