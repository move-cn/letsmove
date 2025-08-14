module summerpursuit_faucet::summerpursuit_faucet {

    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::url;
    use std::ascii::string;
    // 结构体
    public struct SUMMERPURSUIT_FAUCET  has drop {}

    // 初始化
    fun init(witness: SUMMERPURSUIT_FAUCET, ctx:&mut TxContext){
        let (treasury_cap,metadata) = coin::create_currency(
            witness,
            6,
            b"BRF", //代币的名称
            b"summerpursuitFaucet",
            b"summerpursuit facet is so cool",
            option::none(),
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    // 铸造
    public entry fun mint(treasury_cap: &mut TreasuryCap<SUMMERPURSUIT_FAUCET>,
                          amount: u64,
                          recipient: address,
                          ctx: &mut TxContext){
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    // 新增的地址 mint 函数
    public entry fun mint_to_two_addresses(
        treasury_cap: &mut TreasuryCap<SUMMERPURSUIT_FAUCET>,
        amount1: u64,
        recipient1: address,
        amount2: u64,
        recipient2: address,
        ctx: &mut TxContext,
    ) {
        // 第一个地址 mint
        coin::mint_and_transfer(treasury_cap, amount1, recipient1, ctx);

        // 第二个地址 mint
        coin::mint_and_transfer(treasury_cap, amount2, recipient2, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<SUMMERPURSUIT_FAUCET>, coin: Coin<SUMMERPURSUIT_FAUCET>) {
        coin::burn(treasury_cap, coin);
    }
}
    //最后 mint 成功示例：
//sui client call --package 0x3eff254dc50a0e5b0b0a946a393310d057b21a6ed1e187cab1a7520b92e2d9b5  --module summerpursuit_faucet --function mint_to_two_addresses --args 0x51bae409205c88f5141ab47a98fcbe03d4fbcc63fed767a2f4cffe25f57b7f5c  100 0x6f8227357ba0f3d2e3c72de204619d127201800f96e1424e2ebf29ae0c536a83 50 0x6f8227357ba0f3d2e3c72de204619d127201800f96e1424e2ebf29ae0c536a83 --gas-budget=100000000

