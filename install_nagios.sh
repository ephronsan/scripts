#!/bin/bash
### Bash script to install nagios3 in Ubuntu server
echo "###########################"
echo "Updating package lists"
echo "###########################"
sudo apt-get update

echo "###########################"
echo "Installing Apache"
echo "###########################"
sudo apt-get -y install apache2

echo "###########################"
echo "Installing dependency packages for nagios"
echo "###########################"
sudo apt-get -y install build-essential unzip openssl libssl-dev libgd2-xpm-dev xinetd apache2-utils

echo "###########################"
echo "Installing nagios3 packages - You will be prompted to provide password for nagiosadmin user"
echo "###########################"
sleep 5
sudo apt-get -y  install nagios-plugins nagios3 nagios-plugins-basic nagios-plugins-extra nagios-snmp-plugins nagios-nrpe-plugin nagios3-core nagios-plugins-standard nagios3-cgi nagios-plugins-contrib
echo "###########################"
echo "Installation Complete ! Nagios webinterface will be available at http://yourIP/nagios3"
echo "###########################"

