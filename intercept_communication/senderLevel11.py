#! /usr/bin/env python

import sys
from scapy.all import *

# DATAS SECTIONS 
SOURCE_HOST = get_if_hwaddr("eth0")
DEST_HOST = "ff:ff:ff:ff:ff:ff"
IP_SRC = "10.0.0.2"
IP_DEST = "10.0.0.3"

# FUNCTIONS 
ETHER = Ether(src=SOURCE_HOST,dst=DEST_HOST)
Internet = IP(src=IP_SRC,dst=IP_DEST)

# Craft the SYN packet
syn_packet = ETHER / Internet / TCP(sport=31337, dport=31337, seq=31337, flags="S")

print("prepare sending...")
# Send the SYN packet and receive the SYN-ACK packet
result, syn_ack_packet = srp(syn_packet, iface="eth0") #iface for receiving SYNACK packet
print("received the packet")
print(result[0]) # results datas
query, answer = result[0]
syn_ack_packet = ETHER / Internet / TCP(sport=31337, dport=31337, seq=answer["TCP"].ack, ack=answer["TCP"].seq + 1, flags="A")
rsp, syn_ack_p = sendp(syn_ack_packet, iface="eth0") #iface for receiving SYNACK packet
