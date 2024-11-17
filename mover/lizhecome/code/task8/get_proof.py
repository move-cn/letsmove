import hashlib
import random

def sha3_256(data: bytes) -> bytes:
    """计算 sha3_256 哈希"""
    return hashlib.sha3_256(data).digest()

def find_proof(sender_bytes: bytes, challenge_bytes: bytes, difficulity: int = 3) -> list:
    """寻找满足条件的 proof 并返回字节数组"""
    while True:
        # 随机生成 8 字节的 proof
        proof = random.randbytes(8)
        
        # 构建 full_proof = proof + sender_bytes + challenge_bytes
        full_proof = proof + sender_bytes + bytes(challenge_bytes)
        
        # 计算 sha3_256 哈希
        hash_result = sha3_256(full_proof)
        
        # 计算前 difficulity 个字节的前缀和
        prefix_sum = sum(hash_result[i] for i in range(difficulity))
        
        # 满足 prefix_sum == 0 的条件
        if prefix_sum == 0:
            print(f"Proof found (byte array): {[b for b in proof]}")
            return [b for b in proof]

# 将 sender 转换为字节数组（16 进制字符串转为 bytes）
sender_hex = "43d945f82670c017d1989a6613612092e07560dcf88580f6649c4c0b7aa54e44"
sender_bytes = bytes.fromhex(sender_hex)

# 使用提供的 challenge_bytes
challenge_bytes = [
    25, 231, 108, 165, 4, 197, 165, 250, 94, 33, 74, 69, 252, 166, 192, 88,
    23, 27, 163, 51, 246, 218, 137, 123, 130, 115, 16, 148, 80, 77, 90, 185,
    24, 53, 123, 75, 62, 115, 100, 82, 75, 76, 48, 74, 44, 60, 65, 40, 94, 45,
    126, 115, 77, 126, 95, 121, 51, 3, 0, 0, 0, 0, 0, 0, 0, 88, 0, 0, 0, 0, 0, 0, 0
]

# 计算 proof 并输出为字节数组
proof = find_proof(sender_bytes, challenge_bytes)
print(f"Calculated proof as byte array: {proof}")