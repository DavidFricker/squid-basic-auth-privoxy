# squid-basic-auth-privoxy

One command setup of a squid basicauth protected privoxy server on ubuntu

`bash ./setup.sh`

run squid -z for each conf file to make a cache dir for each
`sudo squid -z -f /etc/squid/squid.conf`

run squid to start both servers
`sudo squid -f /etc/squid/squid.conf`

each conf file contains a PID file name to avoid conflict to allow both squid instances to run at the same time


tried and tested on debian 9.5

Remeber to open the firewall through aws lightsail or ec2
