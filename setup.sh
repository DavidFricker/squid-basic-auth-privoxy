#!/bin/bash
#Setup commands
sudo apt-get update
sudo apt-get install apache2-utils squid -y
sudo apt-get install privoxy

#config commands
read -e -p "Your desired username: " usrn
htpasswd -c /etc/squid/passwd $usrn
touch /etc/squid/blacklist.acl	
wget -O /etc/squid/squid.conf https://raw.githubusercontent.com/DavidFricker/squid-basic-auth-privoxy/master/privoxyconfig.conf

#run
service squid restart && update-rc.d squid defaults
firew2
