#! /usr/bin/env python

import sys
from scapy.all import *

# Craft the TCP packet - send only
custom_tcp_packet = sendp( Ether(src=get_if_hwaddr("eth0"),dst="ff:ff:ff:ff:ff:ff") / IP(dst="10.0.0.3") / TCP(sport=31337, dport=31337, seq=31337, ack=31337, flags="APRSF"), iface="eth0")

