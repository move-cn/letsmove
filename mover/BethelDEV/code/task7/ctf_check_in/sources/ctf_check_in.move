module ctf_check_in::ctf_check_in {
    use std::ascii::{String, string};
    use std::bcs;
    use std::hash::sha3_256;
    use std::vector;
    use sui::event;
    use sui::object;
    use sui::random;
    use sui::random::Random;
    use sui::transfer::share_object;
    use sui::tx_context::{Self, TxContext};

    const ESTRING: u64 = 0;

    public struct Flag has copy, drop {
        sender: address,
        flag: bool,
        ture_num: u64,
        github_id: String
    }

    public struct FlagString has key {
        id: UID,
        str: String,
        ture_num: u64
    }

    fun init(ctx: &mut TxContext) {
        let flag_str = FlagString {
            id: object::new(ctx),
            str: string(b"LetsMoveCTF"),
            ture_num: 0
        };
        share_object(flag_str);
    }

/**
get_flag函数主要逻辑是，利用 assert! 宏进行验证，
将传入的 flag（以字节向量形式表示的外部传入的标志数据）与对构造好的 bcs_flag 数据进行 sha3_256 哈希计算后的结果做比较。
如果两者不相等，则会触发错误（错误码由常量 ESTRING 表示），意味着标志验证失败；
若相等，则说明传入的标志符合预期，验证通过，继续后续逻辑。
*/
    entry fun get_flag(
        flag: vector<u8>,
        github_id: String,
        flag_str: &mut FlagString,
        rand: &Random,
        ctx: &mut TxContext
    ) {
        // 定义一个可变的字节向量
        let mut bcs_flag = bcs::to_bytes(&flag_str.str);
        // 将GitHub ID对应的字节追加到bcs_flag字节向量后面
        vector::append<u8>(&mut bcs_flag, *github_id.as_bytes());

        // 验证传入的标志（flag）与 bcs_flag是否一致
        assert!(flag == sha3_256(bcs_flag), ESTRING);

        // 调用getRandomString函数，获取一个随机字符串
        // 更新FlagString结构体中的str字段，替换原来的字符串内容
        flag_str.str = getRandomString(rand, ctx);

        // 将FlagString结构体中的ture_num字段值加1
        flag_str.ture_num = flag_str.ture_num + 1;

        // 触发一个事件（event）
        // 更新后的ture_num值以及传入的GitHub ID等信息
        event::emit(Flag {
            sender: tx_context::sender(ctx),
            flag: true,
            ture_num: flag_str.ture_num,
            github_id
        });
    }


    fun getRandomString(rand: &Random, ctx: &mut TxContext): String {
        let mut gen = random::new_generator(rand, ctx);

        let mut str_len = random::generate_u8_in_range(&mut gen, 4, 30);

        let mut rand: vector<u8> = b"";
        while (str_len != 0) {
            let rand_num = random::generate_u8_in_range(&mut gen, 34, 126);
            vector::push_back(&mut rand, rand_num);
            str_len = str_len - 1;
        };

        string(rand)
    }
}
