#!/bin/bash
sed -ri "s/hostname .+/hostname $HOSTNAME/" /etc/quagga/zebra.conf
sed -ri "s/hostname .+/hostname $HOSTNAME/" /etc/quagga/bgpd.conf
chown quagga.quaggavty /etc/quagga/*.conf
chmod 640 /etc/quagga/*.conf

echo "1" > /proc/sys/net/ipv4/ip_forward
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
echo "password bgp" >> /etc/quagga/zebra.conf

/etc/init.d/quagga restart
