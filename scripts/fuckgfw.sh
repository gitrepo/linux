#!/bin/sh
#set default gateway for vpn route table.
ip route add default dev tun0 table vpn
 
#add censored ip to vpn route table.
for line in `cat /etc/vpnc/fuckgfw.txt`
do
  if [[ ${line:0:1} != "#" ]] ;then
  ip rule add to $line table vpn
  else :
  fi
done
