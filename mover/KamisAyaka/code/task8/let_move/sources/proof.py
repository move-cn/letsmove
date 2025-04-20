import hashlib
from itertools import count

# 配置参数
DIFFICULITY = 3  # 合约中 challenge.difficulity 的值
SENDER_ADDR = "0x5e17de73d5c924dde91b5b03abe25dec994f97e42896a336a816827163fe6cd9"
Package_address = "19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9" #包地址
NEW_STR = "&@ol4Rv6lT7/tE4#-#i5t5f1\\:hxCX"
ture_num = 132
str_bytes = NEW_STR.encode('ascii')
CHALLENGE_BCS = (
    bytes.fromhex(Package_address) +  # UID
    bytes([len(str_bytes)]) +     # 字符串长度前缀
    str_bytes +                   # 字符串内容
    (DIFFICULITY).to_bytes(8, 'little') +   # difficulity
    (ture_num).to_bytes(8, 'little')   # ture_num
)


def find_valid_proof():
    """
    暴力破解算法，寻找满足哈希条件的 proof
    返回格式：bytes 类型的 proof
    """
    # 地址字节处理（去掉0x前缀）
    addr_bytes = bytes.fromhex(SENDER_ADDR[2:])

    # 预计算固定部分字节
    fixed_part = addr_bytes + CHALLENGE_BCS

    # 尝试从 1 字节开始逐步增加 proof 长度
    for proof_len in count(1):
        print(f"Trying proof length: {proof_len} bytes")

        for i in range(256 ** proof_len):
            # 生成候选 proof（小端序编码）
            proof = i.to_bytes(proof_len, 'little')

            # 构建完整 proof
            full_proof = proof + fixed_part

            # 计算哈希
            h = hashlib.sha3_256(full_proof).digest()

            # 检查前 N 个字节和
            if sum(h[:DIFFICULITY]) == 0:
                print(f"\nFound valid proof!")
                print(f"Proof hex: 0x{proof.hex()}")
                print(f"SHA3-256 hash: 0x{h.hex()}")
                return proof


if __name__ == "__main__":
    found_proof = find_valid_proof()

# proof shell
# sui client call 
# --package 0x097a3833b6b5c62ca6ad10f0509dffdadff7ce31e1d86e63e884a14860cedc0f 
# --module lets_move   
# --function get_flag   
# --args "0x8b1e1e00"  "KamisAyaka" 0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9 0x8