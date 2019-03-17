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
wget -O /etc/squid/squidpt.conf https://raw.githubusercontent.com/DavidFricker/squid-basic-auth-privoxy/master/privoxyconfigpassthrough.conf
wget -O /etc/init.d/squidpt https://raw.githubusercontent.com/DavidFricker/squid-basic-auth-privoxy/master/initdpassthrough

squid -z -f /etc/squid/squid.conf > /dev/null
squid -z -f /etc/squid/squidpt.conf > /dev/null

#run
#service squid restart && update-rc.d squid defaults
#service squidpt restart && update-rc.d squidpt defaults

update-rc.d squidpt defaults

# Opening Squid port 8888 for clients to connect
iptables -I INPUT -p tcp --dport 8888 -j ACCEPT
iptables -I INPUT -p tcp --dport 9999 -j ACCEPT
iptables-save
