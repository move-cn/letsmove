module su_coin::chara64d_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct CHARA64D_COIN has drop {}

    fun init(witness: CHARA64D_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<CHARA64D_COIN>(
            witness,
            9,
            b"CHARA64D_COIN",
            b"CHARA64D_COIN",
            b"coin create by chara64d",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/169955298")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<CHARA64D_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<CHARA64D_COIN>, 
        coin: Coin<CHARA64D_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}