import hashlib
import base64
from typing import List

# 模拟 Challenge 对象的初始状态（需根据实际合约构造）
def serialize_challenge() -> bytes:
    # BCS 序列化逻辑：str="LetsMoveCTF", difficulty=3, ture_num=0
    # 简化示例，实际需使用 BCS 库
    str_bytes = b"LetsMoveCTF"
    difficulty_bytes = 3.to_bytes(8, 'little')  # u64 类型，8字节
    ture_num_bytes = 0.to_bytes(8, 'little')    # u64 类型，8字节
    
    # 拼接各字段（实际 BCS 格式可能更复杂）
    return str_bytes + difficulty_bytes + ture_num_bytes

# 计算符合条件的 proof
def find_valid_proof(sender_address: bytes) -> List[int]:
    challenge_bytes = serialize_challenge()
    proof = []  # 初始为空字节数组
    
    while True:
        # 构造 full_proof = proof + sender_bytes + challenge_bytes
        full_proof = bytes(proof) + sender_address + challenge_bytes
        
        # 计算 SHA3-256 哈希
        hash_result = hashlib.sha3_256(full_proof).digest()
        
        # 检查前3字节之和是否为0
        if sum(hash_result[:3]) == 0:
            return proof
        
        # 尝试下一个可能的 proof（简单递增，实际可优化）
        proof = increment_proof(proof)

# 递增 proof 数组（类似计数器）
def increment_proof(proof: List[int]) -> List[int]:
    if not proof:  # 空数组 -> [0]
        return [0]
    
    proof = proof.copy()
    i = len(proof) - 1
    
    while i >= 0:
        if proof[i] < 255:
            proof[i] += 1
            return proof
        else:
            proof[i] = 0
            i -= 1
    
    # 所有位都是255 -> 增加一位
    return [0] + proof

# 主函数：生成 proof 并转为十六进制
def main():
    # 替换为你的 Sui 地址字节（需从地址字符串转换）
    sender_address = bytes.fromhex("你的Sui地址去掉0x前缀")
    
    # 计算符合条件的 proof
    proof = find_valid_proof(sender_address)
    
    # 转为十六进制字符串（如 "0x1a2b3c"）
    proof_hex = "0x" + bytes(proof).hex()
    print(f"找到有效 proof: {proof_hex}")
    
    return proof_hex

if __name__ == "__main__":
    main()