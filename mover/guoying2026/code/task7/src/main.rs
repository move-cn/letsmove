use sha3::{Digest, Sha3_256};

fn main() {
    // 当前从链上获取的 flag_str.str 的值（根据你的对象查询结果替换此字符串）
    // 注意：如果字符串中有双引号，记得转义，如 \" 。
    let current_str = "?K{P%7W;%JpU=|o29G/qBy:_sLh4";

    // 你的 GitHub ID
    let github_id = "guoying2026";

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
}