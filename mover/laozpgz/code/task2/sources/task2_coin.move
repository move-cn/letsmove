/// Module: task2
module task2::laozpgz_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct LAOZPGZ_COIN has drop {}

    fun init(witness: LAOZPGZ_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<LAOZPGZ_COIN>(
            witness,
            9,
            b"LaozpgzCoin",
            b"Laozpgz Coin",
            b"lets_move task2 coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/22661987")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<LAOZPGZ_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<LAOZPGZ_COIN>, 
        coin: Coin<LAOZPGZ_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}