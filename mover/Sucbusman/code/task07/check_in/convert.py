#!/bin/python3
a = '2f50fecb0e4832e844ef2aa72e8add9a7f44a7ef2e0b3bb37ede69f843648cc4'
ba = bytearray.fromhex(a)
l = []
for b in ba:
    l.append(b)
print(l)
