import hashlib
import random

def sha3_256(data: bytes) -> bytes:
  return hashlib.sha3_256(data).digest()

def find_proof(sender: bytes, challenge: bytes) -> list:
  difficulty = 3
  while True:
    proof = random.randbytes(8)

    full_proof = proof + bytes(sender) + bytes(challenge)

    hash_proof = sha3_256(full_proof)

    total = hash_proof[0] + hash_proof[1] + hash_proof[2]

    if total == 0:
      print(f"Proof is {[b for b in proof]}")
      return [b for b in proof]

send_bytes = [139,25,28,37,212,219,170,59,73,215,127,157,129,129,236,87,246,22,113,33,146,194,100,236,13,143,50,119,147,68,223,168]

challenge_bytes = [25,231,108,165,4,197,165,250,94,33,74,69,252,166,192,88,23,27,163,51,246,218,137,123,130,115,16,148,80,77,90,185,23,118,59,36,111,100,64,87,46,74,99,124,38,118,70,55,81,110,62,105,102,76,46,55,3,0,0,0,0,0,0,0,118,0,0,0,0,0,0,0]

reslut = find_proof(send_bytes, challenge_bytes);
print(reslut)