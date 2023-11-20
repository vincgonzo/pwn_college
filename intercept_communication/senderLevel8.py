#! /usr/bin/env python

import sys
from scapy.all import sendp,Ether,conf
conf.verb = 0
ans = sendp(Ether(src="02:42:0a:00:1f:af", dst="ff:ff:ff:ff:ff:ff", type=0xFFFF), iface="eth0")
print(r"\begin{tabular}{|l|l|}")
print(r"\hline")
print(r"Ether\\")
print(r"\hline")
for snd,rcv in ans:
    print(rcv.sprintf(r"%Ether.src%\\"))
print(r"\hline")
print(r"\end{tabular}")
