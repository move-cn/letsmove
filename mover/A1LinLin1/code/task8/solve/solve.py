import hashlib
import random

# 替换为你的 Sui 地址（sender BCS 编码）
sender_bcs = bytes.fromhex("f5faaeb116a7de809967575794603a84cf318e8797ef50d83a0e162781314c3d")

# 链上 Challenge 对象的 BCS 编码（通过 `sui client object <id> --bcs` 获得）
challenge_bcs = bytes([
    25, 231, 108, 165, 4, 197, 165, 250, 94, 33, 74, 69, 252, 166, 192, 88,
    23, 27, 163, 51, 246, 218, 137, 123, 130, 115, 16, 148, 80, 77, 90, 185,
    25, 69, 83, 98, 75, 117, 51, 35, 107, 74, 46, 61, 37, 83, 68, 52,
    73, 51, 74, 40, 75, 68, 40, 68, 113, 89, 3, 0, 0, 0, 0, 0,
    0, 0, 134, 0, 0, 0, 0, 0, 0, 0
])

# 难度值（对应 challenge.difficulity）
difficulty = 3

# Hash 函数
def sha3_256(data: bytes) -> bytes:
    return hashlib.sha3_256(data).digest()

# 爆破逻辑
def generate_proof(sender: bytes, challenge: bytes, difficulty: int):
    attempt = 0
    while True:
        # 生成 8 字节随机 proof
        proof = random.randbytes(8)

        # 拼接 full_proof
        full_proof = proof + sender + challenge

        # 计算哈希
        hash_bytes = sha3_256(full_proof)

        # 检查是否满足 difficulty 条件（前缀为0）
        if all(b == 0 for b in hash_bytes[:difficulty]):
            print(f"\n✅ Found after {attempt} attempts!")
            print(f"Proof (hex)       : 0x{proof.hex()}")
            print(f"Proof (byte array): {[b for b in proof]}")
            print(f"Hash              : {hash_bytes.hex()}")
            return

        attempt += 1
        if attempt % 100000 == 0:
            print(f"Tried {attempt} attempts...")

# 执行爆破
generate_proof(sender_bcs, challenge_bcs, difficulty)
