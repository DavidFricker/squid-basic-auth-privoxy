#!/bin/bash
#Setup commands
sudo apt-get update
sudo apt-get install apache2-utils squid -y
sudo apt-get install privoxy


read -e -p "Your desired username: " usrn
htpasswd -c /etc/squid/passwd $usrn
touch /etc/squid/blacklist.acl	

wget -O /etc/squid/squid.conf https://raw.githubusercontent.com/DavidFricker/squid-basic-auth-privoxy/master/privoxyconfig.conf
cp /etc/squid/squid.conf /etc/init.d/squid

service squid restart && update-rc.d squid defaults
firew2
