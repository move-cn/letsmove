#!/bin/python3
import hashlib
import os
import pickle

sender = bytearray.fromhex('f2fb3e17f0ec9e585c08d1f762e9671abd3af955c5325a7747c308bde2b80fdf')
challenge = bytearray.fromhex('19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab90d7b3e7a404e40336b773557593403000000000000009500000000000000')

def sha3_256(data:bytearray):
    H = hashlib.sha3_256()
    H.update(data)
    return H.digest()

def generate_all_bytearrays(start_from: bytearray = None):
    if start_from is not None:
        start_value = int.from_bytes(start_from, 'big')
        length = len(start_from)
    else:
        start_value = 0
        length = 1

    while True:
        max_value = 256 ** length
        i = start_value if start_value < max_value else 0
        while i < max_value:
            yield bytearray(i.to_bytes(length, 'big'))
            i += 1
        length += 1
        start_value = 0  # Only use custom start_value once

def ba2vector(ba:bytearray):
    l = []
    for b in ba:
        l.append(b)
    return l

def solve():
    proof = bytearray()
    t = 0
    logf = 'log.pkl'
    if os.path.exists(logf):
        with open(logf,'rb') as f:
            proof = pickle.load(f)
    #    t = ipt['t']
    #    proof = ipt['proof']
        print('[+] Start with proof',proof)
    if proof:
        gen = generate_all_bytearrays(proof)
    else:
        gen = generate_all_bytearrays()
    try:
        while True:
            proof = next(gen)
            full_proof = bytearray()
            full_proof += proof
            full_proof += sender
            full_proof += challenge
            h = sha3_256(full_proof)
            #print(h)
            #input()
            if h[0] +h[1] + h[2] == 0:
            #if h[0] == 0:
                print('[+] Found! proof:',proof)
                print('[+] hash!',h)
                print(ba2vector(proof))
                break
            
    except KeyboardInterrupt as e:
        print('[-] Stop at',proof)
        with open(logf,'wb') as f:
            pickle.dump(proof,f)

if __name__ == '__main__':
    #print(sha3_256(bytearray([0,0])))
    solve()
