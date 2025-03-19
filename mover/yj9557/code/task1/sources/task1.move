/*
/// Module: task1
module task1::task1;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module task1::task1;

use std::ascii::{String, string};
use sui::object::{Self,UID};
use sui::transfer::transfer;
use sui::tx_context::{TxContext, sender};

public struct Hello has key{
    id:UID,
    say: String
}

fun init(ctx: &mut TxContext) {
    let hello_move = Hello {
        id:object::new(ctx),
        say: string(b"hello yj9557"),
    };
    transfer(hello_move, sender(ctx));
}
