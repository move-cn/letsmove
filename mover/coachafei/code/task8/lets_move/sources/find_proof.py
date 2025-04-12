#!/usr/bin/env python

import hashlib 
import random

def sha3_256(data: bytes) -> bytes:
    """
    Calculate the SHA3-256 hash of the given data.
    
    :param data: The input data to hash.
    :return: The SHA3-256 hash of the data.
    """
    return hashlib.sha3_256(data).digest()

def find_proof(sender, challenge, diffculty: int=3) -> list:
    """
    Find a proof of work for the given sender and challenge.
    
    :param sender: The sender's address.
    :param challenge: The challenge data.
    :param diffculty: The difficulty level (number of leading zeros).
    :return: A list containing the nonce and the proof.
    """
    while True:
        proof = random.randbytes(8)
        full_proof = proof + sender + challenge
        proof_hash = sha3_256(full_proof)
        if sum(proof_hash[:diffculty]) == 0:
            print(F"Found proof: {[b for b in proof]}")
            return [b for b in proof]

if __name__ == "__main__":
    # Example usage
    sender_hex = "d95ac7e46d610afd67d3862ca3db7ef8afc7c753c7b963e2a385bf5e2d638635"
    sender = bytes.fromhex(sender_hex)
    test_list = []
    for byte in sender:
        test_list.append(byte)
    print(test_list)

    challenge = bytes([25,231,108,165,4,197,165,250,94,33,74,69,252,166,192,88,23,27,163,51,246,218,137,123,130,115,16,148,80,77,90,185,30,88,92,89,34,98,42,97,120,61,91,120,119,66,35,49,38,49,111,80,126,105,63,89,92,93,76,87,59,119,104,3,0,0,0,0,0,0,0,127,0,0,0,0,0,0,0])
    # difficulty = 3

    proof = find_proof(sender, challenge)