import hashlib
import random
import secrets
import struct
import sys

# 模拟 Proof 数据、Github ID 和 Challenge 数据

def calculate_sha3_256(data):
    """计算 SHA3-256 哈希"""
    return hashlib.sha3_256(data).digest()

def check_prefix_sum(hash_value, difficulty):
    """检查哈希前 'difficulty' 位的字节和是否为 0"""
    prefix_sum = sum(hash_value[:difficulty])  # 前 difficulty 个字节求和
    return prefix_sum == 0

# 设置 Challenge 数据
difficulty = 3  # 设置 difficulty 为 3（根据实际情况修改）
github_id = "hwen227"  # Github ID

# 模拟 'get_flag' 函数的工作
# 1. 构造 full_proof（proof + sender + challenge）
sender = "0xd3ee8aae11bfeb88185f13e3166a8856b95e7c7ca100c0d03412175c2e277802"  # 假设 sender
sender_bytes = bytes.fromhex(sender[2:])  # 从 hex 转换为字节
challenge_bytes = [25, 231, 108, 165, 4, 197, 165, 250, 94, 33, 74, 69, 252, 166, 192, 88, 23, 27, 163, 51, 246, 218, 137, 123, 130, 115, 16, 148, 80, 77, 90, 185, 6, 76, 79, 55, 124, 53, 56, 3, 0, 0, 0, 0, 0, 0, 0, 99, 0, 0, 0, 0, 0, 0, 0]

# 设置最大搜索次数
max_attempts = 10000000 # 最大搜索次数

# 循环直到找到符合条件的哈希
found = False
counter = 0
current_nonce = secrets.randbelow(2**64)  # 使用随机数生成64位整数作为 nonce

while not found and counter < max_attempts:
    # 2. 随机生成 proof
    proof = struct.pack("<Q", current_nonce)  # 通过 struct 打包成 8 字节

    # 3. 构造 full_proof
    full_proof = proof + sender_bytes + bytes(challenge_bytes)

    # 4. 计算 SHA3-256 哈希值
    hash_value = calculate_sha3_256(full_proof)

    # 5. 检查哈希前 'difficulty' 位字节和是否为 0
    if check_prefix_sum(hash_value, difficulty):
        found = True
        print(f"成功找到了符合要求的哈希值: {hash_value.hex()}")
        print(f"proof的值为: {proof.hex()}")  # 输出 proof 的十六进制表示
    else:
        # 如果没有符合条件的哈希，则继续生成新的 proof
        counter += 1
        current_nonce += 1  # 增加 nonce
        if counter % 1000 == 0:  # 每 1000 次尝试输出一次
            print(f"尝试次数: {counter}, 当前哈希值: {hash_value.hex()}")
        print("没有符合要求的哈希，继续生成新的 proof")

# 如果达到最大次数仍未找到合适的哈希，退出程序
if not found:
    print(f"未能在 {max_attempts} 次尝试中找到符合条件的哈希，程序退出。")
    sys.exit(0)
