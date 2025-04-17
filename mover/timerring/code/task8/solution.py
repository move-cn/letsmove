import hashlib
import random


def sha3_256(data: bytes) -> bytes:
    """Calculate SHA3-256 hash"""
    return hashlib.sha3_256(data).digest()


def find_proof(sender: bytes, challenge: bytes, difficulty: int = 3) -> list:
    """Find a proof that satisfies the condition and return the byte array"""
    while True:
        # Generate a random 8-byte proof
        proof = random.randbytes(8)

        # Build full_proof = proof + sender + challenge
        full_proof = proof + sender + challenge

        # Calculate SHA3-256 hash
        hash_result = sha3_256(full_proof)

        # Check if the sum of the first difficulty bytes is 0
        if sum(hash_result[:difficulty]) == 0:
            print(f"Proof found (byte array): {[b for b in proof]}")
            return [b for b in proof]

# sender BCS
sender_address = "ea248879ca7fe4c0af69164caa96b5ebd3ce534ba3fcc42ffeb7ec4cb3b434bc"
sender_bytes = bytes.fromhex(sender_address)

# challenge BCS
challenge_bytes = bytes([25, 231, 108, 165, 4, 197, 165, 250, 94, 33, 74, 69, 252, 166, 192, 88, 23, 27, 163, 51, 246, 218, 137, 123, 130, 115, 16, 148, 80, 77, 90, 185, 16, 94, 59, 103, 54, 44, 48, 93, 56, 55, 123, 87, 106, 93, 42, 94, 87, 3, 0, 0, 0, 0, 0, 0, 0, 136, 0, 0, 0, 0, 0, 0, 0])


proof = find_proof(sender_bytes, challenge_bytes)
print(f"Calculated proof as byte array: {proof}")