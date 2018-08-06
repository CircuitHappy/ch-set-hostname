#!/bin/bash
#new hostname prefix
hostnprefix="MissingLink-"

#Assign existing hostname to $hostn
hostn=$(cat /etc/hostname)

#Display existing hostname
echo "Existing hostname is $hostn"

#Ask for new hostname $newhost
newhost=$hostnprefix$(cat /sys/class/net/wlan0/address | awk -F":" '{print $5$6}')

#change hostname in /etc/hosts & /etc/hostname
sudo sed -i "s/$hostn/$newhost/g" /etc/hosts
sudo sed -i "s/$hostn/$newhost/g" /etc/hostname

#display new hostname
echo "Your new hostname is $newhost"
