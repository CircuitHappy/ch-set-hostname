#!/bin/bash
#set bold and normal text variables
bold=$(/usr/bin/tput bold)
normal=$(/usr/bin/tput sgr0)

#new hostname prefix
hostnprefix="MissingLink-"

#Assign existing hostname to $hostn
hostn=$(cat /etc/hostname)

#New hostname is hostprefix + last four characters of MAC
newhost=$hostnprefix$(/bin/cat /sys/class/net/wlan0/address | /usr/bin/awk -F":" '{print $5$6}')

#change hostname in /etc/hosts & /etc/hostname
/bin/sed -i "s/$hostn/$newhost/g" /etc/hosts
/bin/echo $newhost > /etc/hostname

#update hostname right now
/bin/hostname $newhost

#display new hostname
/bin/echo "***********************************************"
/bin/echo "Your new hostname is ${bold}$newhost${normal}"
/bin/echo "***********************************************"
