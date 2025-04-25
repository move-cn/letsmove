/*
/// Module: ctf8
module ctf8::ctf8;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module ctf8::lets_move {
    use std::ascii::{String, string};
    use std::hash;
    use sui::event;
    use sui::bcs;
    use sui::random;
    use sui::random::Random;
    use sui::transfer::share_object;

    #[test_only]
    use std::debug::print;

    const EPROOF: u64 = 0;

//定义了一个公共结构体 Flag，用于事件记录,sender记录触发事件用户地址；flag记录成功true；成功次数，
    public struct Flag has copy, drop {
        sender: address,
        flag: bool,
        ture_num: u64,
        github_id: String
    }

    public struct Challenge has key {
        id: UID,
        str: String,
        difficulity: u64,   //difficulity: u64：难度级别，决定哈希前缀检查的字节数
        ture_num: u64
    }
//定义了初始化函数,初始字符串为 "LetsMoveCTF"，设置难度为 3
    fun init(ctx: &mut TxContext) {
        let flag_str = Challenge {
            id: object::new(ctx),
            str: string(b"LetsMoveCTF"),
            difficulity: 3,   //即哈希前 3 个字节需满足条件
            ture_num: 0,
        };
        share_object(flag_str); //将 Challenge 对象共享，使所有用户都可以访问和修改它
    }

//get_flag 函数（核心功能）
    entry fun get_flag(
        proof: vector<u8>,   //用户提供的证明字节向量
        github_id: String,
        challenge: &mut Challenge, //指向共享的 Challenge 对象的可变引用
        rand: &Random,
        ctx: &mut TxContext
    ) {
//创建一个空的字节向量 full_proof，用于拼接所有输入
        let mut full_proof: vector<u8> = vector::empty<u8>();    
//将用户提供的 proof，发送者的地址，challenge 对象序列化都字节化（ctx）并追加到 full_proof
        vector::append<u8>(&mut full_proof, proof);
        vector::append<u8>(&mut full_proof, tx_context::sender(ctx).to_bytes());
        vector::append<u8>(&mut full_proof, bcs::to_bytes(challenge));
//对 full_proof 计算 SHA3-256 哈希，结果是一个字节向量
        let hash: vector<u8> = hash::sha3_256(full_proof);
//初始化变量：prefix_sum 用于计算哈希前缀字节的和，i 是循环计数器
        let mut prefix_sum: u32 = 0;  
        let mut i: u64 = 0;
//循环检查哈希的前 difficulity 个字节
        while (i < challenge.difficulity) {
            prefix_sum = prefix_sum + (*vector::borrow(&hash, i) as u32);  
            i = i + 1;    //从 hash 中借用第 i 个字节，转为 u32 并累加到 prefix_sum，并计数器递增
        };

        assert!(prefix_sum == 0, EPROOF); //必须为 0，否则抛出错误 EPROOF，表示 proof 无效

        challenge.str = getRandomString(rand, ctx);       
        challenge.ture_num = challenge.ture_num + 1;      //成功次数加1,触发一个Flag事件,记录以下事件

        event::emit(Flag {
            sender: tx_context::sender(ctx),
            flag: true,
            ture_num: challenge.ture_num,
            github_id
        });
    }

//定义一个函数，生成随机字符串并返回
    fun getRandomString(rand: &Random, ctx: &mut TxContext): String {

        //随机生成字符串长度，基于 rand 和 ctx，范围在 4 到 30 之间

        let mut gen = random::new_generator(rand, ctx);
        let mut str_len = random::generate_u8_in_range(&mut gen, 4, 30);
        //初始化一个空字节向量 rand，用于存储随机字符
        let mut rand: vector<u8> = b"";

       //循环生成随机字符，达到指定长度,范围在 34 到 126,将随机字节追加到 rand,rand 转换为 String 类型并返回
        while (str_len != 0) {    
            let rand_num = random::generate_u8_in_range(&mut gen, 34, 126);
            vector::push_back(&mut rand, rand_num);
            str_len = str_len - 1;   //长度计数器减 1
        };

        string(rand)
    }
}
