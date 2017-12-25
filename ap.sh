#/bin/bash!
airmon-ng check kill

sleep 2

sudo ifconfig wlan4 10.5.5.1/24

/etc/init.d/isc-dhcp-server start

sleep 2

sudo iptables -A FORWARD -i wlan4 -o eth4 -s 10.5.5.0/24 -m state --state NEW -j ACCEPT

sudo iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

sudo iptables -t nat -A POSTROUTING -o eth4 -j MASQUERADE

sudo echo "1" >/proc/sys/net/ipv4/ip_forward

hostapd -B /etc/hostapd/hostapd.conf

cd ~

