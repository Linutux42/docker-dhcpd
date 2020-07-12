#!/bin/bash

data_dir="/etc/dhcp"

uid=$(stat -c%u "$data_dir")
gid=$(stat -c%g "$data_dir")
if [ $gid -ne 0 ]; then
  groupmod -g $gid dhcpd
fi
if [ $uid -ne 0 ]; then
  usermod -u $uid dhcpd
fi

[ -e "$data_dir/dhcpd.leases" ] || touch "$data_dir/dhcpd.leases"
  chown dhcpd:dhcpd "$data_dir/dhcpd.leases"
if [ -e "$data_dir/dhcpd.leases~" ]; then
  chown dhcpd:dhcpd "$data_dir/dhcpd.leases~"
fi

/usr/sbin/dhcpd -4 -f -d --no-pid -cf "$data_dir/dhcpd.conf" -lf "$data_dir/dhcpd.leases"
