module hello_world::HuiWang_World_Faucet_Coin {

    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Url, Self};

    public struct HUIWANG_WORLD_FAUCET_COIN has drop {}

    fun init(witness: HUIWANG_WORLD_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<HUIWANG_WORLD_FAUCET_COIN>(
            witness,
            3,
            b"HuiWang_World_Faucet_Coin",
            b"HuiWang_World_Faucet_Coin",
            b"Move-cn Standard Task Coin by HuiWang_World_Faucet_Coin",
            option::some<Url>(
                url::new_unsafe_from_bytes(b"https://imagedelivery.net/cBNDGgkrsEA-b_ixIp9SkQ/sui.svg/public")
            ),
            ctx
        );

        transfer::public_freeze_object(metadata);//冻结coin原数据
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));//转移所有权给调用者，也就是合约发布者
    }

    ///铸造币
    public fun mint(
        treasury_cap: &mut TreasuryCap<HUIWANG_WORLD_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    ///销毁币
    public fun burn(treasury_cap: &mut TreasuryCap<HUIWANG_WORLD_FAUCET_COIN>, coin: Coin<HUIWANG_WORLD_FAUCET_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}