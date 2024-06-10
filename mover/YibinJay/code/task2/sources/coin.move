module task2::yibinjay_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct YIBINJAY_COIN has drop {}

    fun init(witness: YIBINJAY_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<YIBINJAY_COIN>(
            witness,
            9,
            b"YIBINJAY_COIN",
            b"YibinJay",
            b"this is my first virtual coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/167294502")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<YIBINJAY_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<YIBINJAY_COIN>, 
        coin: Coin<YIBINJAY_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}