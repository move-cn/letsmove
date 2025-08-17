/// 模組: hello_move
/// 一個簡單的Hello Move合約，創建一個包含問候消息的物件
module hello_move::hello_move;

use std::ascii::{String, string};
use sui::transfer::transfer;

public struct Hello has key {
    id: UID,
    say: String
}

fun init(ctx: &mut TxContext) {
    let hello_move = Hello {
        id: object::new(ctx),
        say: string(b"jack-751"),
    };
    transfer(hello_move, ctx.sender());
}