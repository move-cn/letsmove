module faucetcoin::faucetcoin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};


    public struct FAUCETCOIN has drop {}


    fun init(witness: FAUCETCOIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<FAUCETCOIN>(witness, 0, b"FaucetHiro", b"fahiro", b"", option::none(), ctx);
        // 共享但不可修改
        transfer::public_freeze_object(metadata);
        // 共享所有权
        transfer::public_share_object(treasury_cap)
    }


    public entry fun mint(treasury_cap: &mut TreasuryCap<FAUCETCOIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }


    public entry fun burn(treasury_cap: &mut TreasuryCap<FAUCETCOIN>, coin: Coin<FAUCETCOIN>) {
        coin::burn(treasury_cap, coin);
    }
}

