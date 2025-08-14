module mika_lahtinen_coin::mika_lahtinen_coin{
    use sui::object::{Self, UID};
    use std::string;
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use sui::coin::{Self, TreasuryCap, Coin};

    public struct MIKA_LAHTINEN_COIN has drop {

    }

    fun init(witness: MIKA_LAHTINEN_COIN, ctx:&mut TxContext) {
       let (treasury_cap, metadata) = coin::create_currency(
        witness,
        6,
        b"MLC",
        b"MIKA_LAHTINEN_COIN",
        b"Coin created by Mika Lahtinen.",
        option::none(),
        ctx
       );

       transfer::public_freeze_object(metadata);
       transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MIKA_LAHTINEN_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ){
        let token = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(token, recipient);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<MIKA_LAHTINEN_COIN>, token: Coin<MIKA_LAHTINEN_COIN>){
        coin::burn(treasury_cap, token);
    }
}
