#! /usr/bin/env python
# ===== Welcome to Intercepting Communication! =====
# In this series of challenges, you will be working within a virtual network in order to intercept networked traffic.
# In this challenge you will manually send an Address Resolution Protocol packet.
# The packet should have `ARP op=is-at` and correctly inform the remote host of where the sender can be found.
# The packet should be sent to the remote host at `10.0.0.3`.

import sys
from scapy.all import *

SOURCE_HOST = get_if_hwaddr("eth0")
DEST_HOST = "change_mac_address_target" # arping
BRDCT = "ff:ff:ff:ff:ff:ff"
IP_SRC = "10.0.0.2"
IP_DEST = "10.0.0.3"

ETHER = Ether(src=SOURCE_HOST,dst=DEST_HOST)
ARP_ = ARP(op="is-at", hwsrc=SOURCE_HOST, psrc=IP_SRC, hwdst=BRDCT, pdst=IP_DEST)

# Craft the ARP packet
send_packet = ETHER / ARP_

print("prepare sending ARP...")
# Send thei ARP packet
sendp(send_packet, iface="eth0") #iface for receiving flag 
