module coin::yemachine_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct YEMACHINE_COIN has drop {}

    fun init(witness: YEMACHINE_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<YEMACHINE_COIN>(
            witness,
            9,
            b"YEMACHINE_COIN",
            b"YEMACHINE",
            b"learning for letsmove, power by yemachine",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/167276459")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<YEMACHINE_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<YEMACHINE_COIN>, 
        coin: Coin<YEMACHINE_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}