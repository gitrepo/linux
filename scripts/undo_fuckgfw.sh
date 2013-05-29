#!/bin/sh
#del default gateway from vpn route table.
ip route del default dev tun0 table vpn
 
#del censored ip from vpn route table.
for line in `cat /etc/vpnc/fuckgfw.txt`
do
  if [[ ${line:0:1} != "#" ]] ;then
  ip rule del to $line table vpn
  else
  echo ""
  fi
done
