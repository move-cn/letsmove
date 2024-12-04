
// 主要内容包括：
// * 创建代币：通过 coin 模块，使用一次性见证（one-time witness）来区分代币种类，并利用 create_currency 函数发行一种新的代币。
// * 铸币功能的实现：通过 coin 模块的 mint 函数来铸造代币，并分配给用户。

/// Module: my_coin
module my_coin::my_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct MY_COIN has drop {}
    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 6, b"silver-x", b"my coin", b"a coin by test", option::none(), ctx );
        // 冻结 metadata 对象，阻止后续的修改
        transfer::public_freeze_object(metadata);
        // 将铸币的权限凭证转移到合约部署者
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    // 铸造代币
    public fun mint_in_my_module(treasury_cap: &mut TreasuryCap<MY_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }

}

