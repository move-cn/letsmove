import hashlib


def generate_proof(challenge_bytes, sender_address, difficulty):
    # Define constants
    EPROOF = 0

    # Convert sender address to bytes array
    sender_bytes = bytes.fromhex(sender_address[2:])  # Skip '0x'

    # Define the `proof` byte array (you need to find correct proof bytes)
    proof = bytearray([0] * difficulty)  # Initialize a dummy proof with zeros

    for i in range(256 ** difficulty):  # Iterate through all possible proof values
        # Convert `i` into bytes and set as proof
        for j in range(difficulty):
            proof[j] = (i >> (8 * j)) & 0xFF

        # Combine proof, sender_bytes, and challenge_bytes
        full_proof = proof + sender_bytes + challenge_bytes

        # Calculate SHA-3 256 hash
        hash_bytes = hashlib.sha3_256(full_proof).digest()

        # Calculate prefix sum
        prefix_sum = sum(hash_bytes[:difficulty])

        if prefix_sum == EPROOF:
            return list(proof)

    return None


# Given challenge bytes
challenge_bytes = [
    25, 231, 108, 165, 4, 197, 165, 250, 94, 33, 74, 69, 252, 166, 192, 88,
    23, 27, 163, 51, 246, 218, 137, 123, 130, 115, 16, 148, 80, 77, 90, 185,
    23, 107, 86, 34, 58, 79, 53, 111, 37, 89, 49, 43, 126, 38, 92, 123, 104,
    83, 47, 47, 66, 51, 74, 102, 3, 0, 0, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0,
    0, 0
]

# Given sender address
sender_address = '0x23128b49c05b475e6459e8f37a122f3aa19681e397e1bc333d14f2014c7b2a64'

# Given difficulty
difficulty = 3

# Generate proof
proof = generate_proof(bytearray(challenge_bytes), sender_address, difficulty)

# Output the proof
print("Proof:", proof)