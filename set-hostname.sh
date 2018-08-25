#!/bin/bash
#set bold and normal text variables
bold=$(tput bold)
normal=$(tput sgr0)

#new hostname prefix
hostnprefix="MissingLink-"

#Assign existing hostname to $hostn
hostn=$(cat /etc/hostname)

#Display existing hostname
echo "Existing hostname is $hostn"

#Ask for new hostname $newhost
newhost=$hostnprefix$(cat /sys/class/net/wlan0/address | awk -F":" '{print $5$6}')

#change hostname in /etc/hosts & /etc/hostname
sed -i "s/$hostn/$newhost/g" /etc/hosts
echo $newhost > /etc/hostname

#update hostname right now
hostname $newhost

#display new hostname
echo "***********************************************"
echo "Your new hostname is ${bold}$newhost${normal}"
echo "***********************************************"
