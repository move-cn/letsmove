// Module: move_coin
module move_coin::maqihao01_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct MAQIHAO01_COIN has drop {}

    fun init(witness: MAQIHAO01_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<MAQIHAO01_COIN>(
            witness,
            9,
            b"MAQIHAO01_COIN",
            b"MAQIHAO01_COIN",
            b"coin create by mqh",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/167278891")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MAQIHAO01_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<MAQIHAO01_COIN>, 
        coin: Coin<MAQIHAO01_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}