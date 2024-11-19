import hashlib
from typing import Optional
import struct

def check_hash_prefix(hash_bytes: bytes, difficulty: int) -> bool:
    """检查hash前缀和是否为0"""
    return sum(hash_bytes[:difficulty]) == 0



def find_proof(sender_address: bytes,  nonce: int, difficulty: int) -> bytes:
    """尝试找到有效的proof"""
    current_nonce = nonce
    max_attempts = 1000000000
    
    while current_nonce < max_attempts:
        nonce_bytes = struct.pack("<Q", current_nonce)
        
        # 使用提供的 challenge_bytes
        challenge_bytes = bytes([25,231,108,165,4,197,165,250,94,33,74,69,252,166,192,88,23,27,163,51,246,218,137,123,130,115,16,148,80,77,90,185,24,82,44,57,77,43,124,110,105,74,69,115,76,99,114,125,96,43,71,125,81,92,64,84,41,3,0,0,0,0,0,0,0,89,0,0,0,0,0,0,0])
        
        # 组合完整的 proof
        full_proof = nonce_bytes + sender_address + challenge_bytes
        
        # 计算 SHA3-256 哈希
        hash_result = hashlib.sha3_256(full_proof).digest()
        
        # 检查是否满足难度要求
        if check_hash_prefix(hash_result, difficulty):
            return nonce_bytes
            
        current_nonce += 1
    
    raise Exception("无法在指定尝试次数内找到有效的 proof")

if __name__ == "__main__":

    
    address = bytes.fromhex("6f73a5a6967015adaa7ef618619e0113170bb576bbd9c8f8ee2156fcb81a510d")
    
    try:
        proof = find_proof(address, 0, 3)
        print(f"找到有效的 proof: {proof.hex()}")
    except Exception as e:
        print(f"错误: {e}")
