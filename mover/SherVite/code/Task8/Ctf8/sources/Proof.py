import hashlib

# 发送者地址（替换为您实际的地址）
sender_address = bytes.fromhex("748ab0101702695a5624680710b9a470f89c6df5cbc4889a6159bb7d5c54f57f")

# Challenge 对象的 BCS 字节
challenge_bytes = bytes([
    232, 228, 170, 217, 183, 101, 218, 47, 144, 238, 129, 196, 158, 69, 80, 234,
    62, 80, 69, 197, 51, 137, 253, 137, 184, 236, 78, 35, 171, 237, 221, 119,
    11, 76, 101, 116, 115, 77, 111, 118, 101, 67, 84, 70, 3, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0
])

# 难度值
difficulty = 3

# 搜索 proof
nonce = 0
while True:
    proof = nonce.to_bytes(8, 'little')  # 使用 8 字节的 proof
    full_proof = proof + sender_address + challenge_bytes
    hash_value = hashlib.sha3_256(full_proof).digest()
    if sum(hash_value[:difficulty]) == 0:
        print(f"找到 proof: {proof.hex()}")
        break
    nonce += 1