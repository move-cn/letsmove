module mycoin::mycoin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};


    public struct MYCOIN has drop {}


    fun init(witness: MYCOIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<MYCOIN>(witness, 0, b"Myhiro", b"myhiro", b"", option::none(), ctx);
        // 共享但不可修改
        transfer::public_freeze_object(metadata);
        // 设置独享权
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }


    public entry fun mint(treasury_cap: &mut TreasuryCap<MYCOIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }


    public entry fun burn(treasury_cap: &mut TreasuryCap<MYCOIN>, coin: Coin<MYCOIN>) {
        coin::burn(treasury_cap, coin);
    }

}

