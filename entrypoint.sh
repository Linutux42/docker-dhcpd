#!/bin/bash

/usr/sbin/dhcpd -4 -f -d --no-pid -cf /etc/dhcp/dhcpd.conf -lf /var/lib/dhcp/dhcpd.leases
