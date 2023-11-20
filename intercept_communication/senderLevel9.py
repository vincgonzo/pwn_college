#! /usr/bin/env python

import sys
from scapy.all import sendp,Ether,IP,conf
conf.verb = 0
ans = sendp(Ether(src="82:d2:ad:35:a9:d1",dst="ff:ff:ff:ff:ff:ff") / IP(src="10.0.0.2",dst="10.0.0.3",proto=0xFF), iface="eth0") #iface for receiving the flag
#ans = sendp(IP(src="10.0.0.2", dst="10.0.0.3", proto=0xFF), iface="eth0")
print(r"\begin{tabular}{|l|l|}")
print(r"\hline")
print(r"IP\\")
print(r"\hline")
for snd,rcv in ans:
    print(rcv.sprintf(r"%IP.src%\\"))
print(r"\hline")
print(r"\end{tabular}")

