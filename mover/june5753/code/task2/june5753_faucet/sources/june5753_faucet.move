/// Module: june5753_faucet 水龙头
module june5753_faucet::june5753_faucet {

    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::url;
    use std::ascii::string;
    // 结构体
    public struct JUNE5753_FAUCET  has drop {}

    // 初始化
    fun init(witness: JUNE5753_FAUCET, ctx:&mut TxContext){
        let (treasury_cap,metadata) = coin::create_currency(
            witness,
            6,
            b"BRF", //代币的名称
            b"june5753Faucet",
            b"June5753 facet is so cool",
            option::some(url::new_unsafe(string(b"https://krseoul.imgtbl.com/i/2024/08/07/66b2ffe52d644.png"))), // option::none()
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    // 铸造
    public entry fun mint(treasury_cap: &mut TreasuryCap<JUNE5753_FAUCET>,
                          amount: u64,
                          recipient: address,
                          ctx: &mut TxContext){
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<JUNE5753_FAUCET>, coin: Coin<JUNE5753_FAUCET>) {
        coin::burn(treasury_cap, coin);
    }

    //最后 mint 成功示例：
   // sui client call --package 0x6cf97a47a354a5a178b7ae3a769c00a56bbea45582be582d06013328f60b44d7 --module june5753_faucet  --function mint --args 0x05ae35d5ce9caa47f90aa0768ff062332b7558501093d75827177f677c91e58e 100 0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3  --gas-budget=100000000
}


