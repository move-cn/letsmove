module check_in::check_in;

use sui::transfer::share_object; // 导入共享对象的功能
use sui::random::{Self, Random}; // 导入随机数生成相关功能
use std::bcs; // 导入 BCS 序列化工具
use std::hash::sha3_256; // 导入 SHA3-256 哈希函数
use sui::event; // 导入事件功能
use std::ascii::{string, String}; // 导入字符串处理工具

// 错误码：字符串验证失败
const ESTRING: u64 = 0;

// 定义一个事件结构体，用于记录 Flag 的相关信息
public struct Flag has copy, drop {
    sender: address, // 发送者地址
    flag: bool, // 是否成功获取 Flag
    ture_num: u64, // 当前 Flag 的计数
    github_id: String // 用户的 GitHub ID
}

// 定义一个资源结构体，用于存储 Flag 的字符串和计数
public struct FlagString has key {
    id: UID, // 唯一标识符
    str: String, // 当前的 Flag 字符串
    ture_num: u64 // 当前 Flag 的计数
}

// 初始化函数：创建一个初始的 FlagString 对象并共享
fun init(ctx: &mut TxContext) {
    let flag_str = FlagString {
        id: object::new(ctx), // 创建一个新的对象 ID
        str: string(b"coachafei"), // 初始字符串为 "LetsMoveCTF"
        ture_num: 0 // 初始计数为 0
    };
    share_object(flag_str); // 将对象共享，使其可被所有人访问
}

// 入口函数：验证 Flag 并更新 FlagString
entry fun get_flag(
    flag: vector<u8>, // 用户提交的 Flag（哈希值）
    github_id: String, // 用户的 GitHub ID
    flag_str: &mut FlagString, // 可变引用，指向 FlagString 对象
    rand: &Random, // 随机数生成器
    ctx: &mut TxContext // 交易上下文
) {
    // 将当前 Flag 字符串序列化为 BCS 格式
    let mut bcs_flag = bcs::to_bytes(&flag_str.str);
    // 将 GitHub ID 的字节追加到序列化后的 Flag 字符串中
    vector::append<u8>(&mut bcs_flag, *github_id.as_bytes());

    // 验证用户提交的 Flag 是否正确
    assert!(flag == sha3_256(bcs_flag), ESTRING);

    // 如果验证通过，生成一个新的随机字符串并更新 FlagString
    flag_str.str = getRandomString(rand, ctx);

    // 更新计数器
    flag_str.ture_num = flag_str.ture_num + 1;

    // 触发事件，记录成功获取 Flag 的信息
    event::emit(Flag {
        sender: tx_context::sender(ctx), // 当前交易的发送者地址
        flag: true, // 标记为成功
        ture_num: flag_str.ture_num, // 当前计数
        github_id // 用户的 GitHub ID
    });
}

// 辅助函数：生成一个随机字符串
fun getRandomString(rand: &Random, ctx: &mut TxContext): String {
    // 创建一个随机数生成器
    let mut gen = random::new_generator(rand, ctx);
    // 随机生成字符串的长度（4 到 30 个字符）
    let mut str_len = random::generate_u8_in_range(&mut gen, 4, 30);

    // 初始化一个空的字节向量
    let mut rand: vector<u8> = b"";
    // 循环生成随机字符，直到达到指定长度
    while (str_len != 0) {
        // 生成一个 ASCII 范围内的随机字符（34 到 126）
        let rand_num = random::generate_u8_in_range(&mut gen, 34, 126);
        vector::push_back(&mut rand, rand_num); // 将随机字符追加到字节向量中
        str_len = str_len - 1; // 减少剩余长度
    };

    // 将字节向量转换为字符串并返回
    string(rand)
}