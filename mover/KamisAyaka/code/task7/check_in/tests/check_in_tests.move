#[test_only]
module check_in::hash_calculator {
    use std::ascii::string;
    use std::bcs;
    use std::hash;
    use sui::test_scenario;
    use std::debug;

    #[test]
    fun verify_correct_flag() {
        // 1. 构造原始数据
        let flag_str = string(b"UE%gMg+)"); // 当前FlagString.str值
        let github_id = string(b"KamisAyaka");
        
        // 2. BCS序列化（与生产代码完全一致）
        let mut bcs_data = bcs::to_bytes(&flag_str);
        vector::append(&mut bcs_data, *github_id.as_bytes());
        
        // 3. 计算SHA3-256哈希
        let result = hash::sha3_256(bcs_data);
        
        // 4. 打印结果（仅测试环境可用）
        debug::print(&result); // 输出：vector[0xA1, 0xB2, ...]（完整32字节）
    }
}