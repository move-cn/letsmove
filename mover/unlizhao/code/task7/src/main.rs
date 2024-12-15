use sha3::{Digest, Sha3_256};

fn main() {
    // 当前从链上获取的 flag_str.str 的值（根据你的对象查询结果替换此字符串）
    // 注意：如果字符串中有双引号，记得转义，如 \" 。

    let current_str = "D#L7K2GRK_+;.C51MnV5l&j|3cKT";

    // 你的 GitHub ID
    let github_id = "unlizhao";

    // 使用bcs对字符串进行序列化，以与Move中使用的bcs::to_bytes一致
    let mut bcs_flag = bcs::to_bytes(&current_str).unwrap();

    // 将 github_id 的字节追加到序列化数据后面
    bcs_flag.extend_from_slice(github_id.as_bytes());

    // 对 bcs_flag 求 sha3_256 哈希
    let mut hasher = Sha3_256::new();
    hasher.update(&bcs_flag);
    let result = hasher.finalize();

    let flag_hash = format!("0x{}", hex::encode(result));
    println!("flag (sha3_256): {}", flag_hash);

// sui client call --package 0x914099b4d1b4f5513acc8aaa4fdc1f67578522b81d818f61bae527d590c6d87d --module check_in --function get_flag --args 0x17b4325d49eb8dcee444e20182a192e682018c6f31fea51c56d54f4b7ddbefe9 unlizhao 0xc8dcd54baa7724177593a9f70598a09ae6a4286f996542e058f248209db08147 0x8

}