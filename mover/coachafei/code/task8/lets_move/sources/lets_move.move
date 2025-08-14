/*
/// Module: lets_move
module lets_move::lets_move;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module lets_move::lets_move;

use std::ascii::{String, string};
use std::hash;
use sui::event;
use sui::bcs;
use sui::random;
use sui::random::Random;
use sui::transfer::share_object;

const EPROOF: u64 = 0;

public struct Flag has copy, drop {
    sender: address,
    flag: bool,
    ture_num: u64,
    github_id: String
}

public struct Challenge has key {
    id: UID,
    str: String,
    difficulity: u64,
    ture_num: u64
}

fun init(ctx: &mut TxContext) {
    let flag_str = Challenge {
        id: object::new(ctx),
        str: string(b"coachafei"),
        difficulity: 3,
        ture_num: 0,
    };
    share_object(flag_str);
}

// 对比
entry fun get_flag (
    proof: vector<u8>,
    github_id: String,
    challenge: &mut Challenge,
    rand: &Random,
    ctx: &mut TxContext
) {
    // 初始化一个空的full_proof，并把获取的证明proof、当前用户的地址和challenge的bcs序列化结果拼接到full_proof中
    let mut full_proof: vector<u8> = vector::empty<u8>();
    vector::append<u8>(&mut full_proof, proof);
    vector::append<u8>(&mut full_proof, tx_context::sender(ctx).to_bytes());
    vector::append<u8>(&mut full_proof, bcs::to_bytes(challenge));
     
    // 对full_proof进行hash计算
    let hash: vector<u8> = hash::sha3_256(full_proof);

    // 计算前n位的和，这里的n是challenge.difficulity
    let mut prefix_sum: u32 = 0;
    let mut i: u64 = 0;
    while (i < challenge.difficulity) {
        prefix_sum = prefix_sum + (*vector::borrow(&hash, i) as u32);
        i = i + 1;
    };

    // 如果前n位的和不为0，则证明失败，抛出异常
    assert!(prefix_sum == 0, EPROOF);

    // 如果前n位的和为0，则证明成功，更新challenge的str和ture_num
    challenge.str = getRandomString(rand, ctx);
    challenge.ture_num = challenge.ture_num + 1;

    event::emit(Flag {
        sender: tx_context::sender(ctx),
        flag: true,
        ture_num: challenge.ture_num,
        github_id: github_id
    });
}

fun getRandomString(rand: &Random, ctx: &mut TxContext): String {
    let mut gen = random::new_generator(rand, ctx);
    let mut str_len = random::generate_u8_in_range(&mut gen, 4, 30);

    let mut result: vector<u8> = vector::empty<u8>();
    while (str_len != 0) {
        let random_num: u8 = random::generate_u8_in_range(&mut gen, 34, 126);
        vector::push_back<u8>(&mut result, random_num);
        str_len = str_len - 1;
    };
    string(result)
}
