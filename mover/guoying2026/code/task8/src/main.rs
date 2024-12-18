use sha3::{Digest, Sha3_256};
use hex::{self, FromHex};
use bcs;
use serde::{Deserialize, Serialize};

// 定义与 Move 中 Challenge 相对应的结构体
#[derive(Serialize, Deserialize)]
struct UID {
    id: [u8; 32],
}

#[derive(Serialize, Deserialize)]
struct Challenge {
    id: UID,
    str: String,
    difficulity: u64,
    ture_num: u64,
}

fn main() {
    // SENDER_BYTES: 将你的 Sui 地址（0x0fdd...）去掉"0x"前缀并转为 32字节数组
    let sender_hex = "0fddc9fbcf9e340fe1b64ea3160d3905eeea39a1951c5084f4522be193fcdcb1";
    let sender_bytes = <[u8; 32]>::from_hex(sender_hex).expect("Invalid sender hex");

    // 按照从链上 object 命令中获得的信息构建 Challenge 对象
    // Challenge fields:
    // id: 0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9
    // str: "Wz;N"
    // difficulity: 3
    // ture_num: 105
    let object_id_hex = "19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9";//链上对象
    let object_id = <[u8; 32]>::from_hex(object_id_hex).expect("Invalid object_id hex");

    let challenge = Challenge {
        id: UID { id: object_id },
        str: "Wz;N".to_string(),
        difficulity: 3,
        ture_num: 105,
    };

    // BCS 序列化 challenge 对象
    let challenge_bcs_bytes = bcs::to_bytes(&challenge).expect("BCS serialization failed");

    // 难度要求：hash 的前 3 个字节为 0
    const DIFFICULTY: usize = 3;

    let mut proof_counter: u64 = 0;
    loop {
        // 将 proof_counter 转成字节
        let proof_bytes = proof_counter.to_le_bytes();

        // 拼接 proof || sender_bytes || challenge_bcs_bytes
        let mut full_data = Vec::new();
        full_data.extend_from_slice(&proof_bytes);
        full_data.extend_from_slice(&sender_bytes);
        full_data.extend_from_slice(&challenge_bcs_bytes);

        // 计算 sha3_256 哈希
        let hash = Sha3_256::digest(&full_data);

        // 检查前3字节是否全0
        if hash.iter().take(DIFFICULTY).all(|&b| b == 0) {
            println!("Found valid proof (hex): {}", hex::encode(&proof_bytes));
            println!("Hash: {}", hex::encode(&hash));
            break;
        }

        proof_counter = proof_counter.wrapping_add(1);
    }
}