+++
title: Task 1-1 note
date: 2024-04-11
+++

# Task 1-1 : Beginning **Move** Language

Welcome to the **Move** development tutorial notes.

Well, for some reasons, I have to take notes in the mixture of Chinese and English, and all of them would be fixed soon in English.

## What is **Move**
- A language for writing smart contracts on blockchain like Solidity.
- Influenced by Rust, design by Rust.
- Spring from Diem project.
- Safe, easy to manipulate data on-chain.
- Platform-agnostic.

## What is the special of **Move** on Sui
- Sui uses its own object-centric global storage
- Addresses represent Object IDs
- Sui objects have globally unique IDs
- Sui has module initializers (init)
- Sui entry points take object references as input 

## An example of smart contract written by **Move** on Sui
```rust
// Hello.move
module hello_move::hello_move {
    use sui::object::{Self, UID};
    use std::ascii::{String, string};
    use sui::tx_context::{TxContext, sender};
    use sui::transfer::transfer;

    public struct Hello has key {
        id: UID,
        say: String
    }
    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id: object::new(ctx),
            say: string(b"move"),
        };

    transfer(hello_move, sender(ctx));    
    }
}
```

