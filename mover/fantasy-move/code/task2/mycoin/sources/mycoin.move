
/// Module: mycoin
module mycoin::fantasy_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct FANTASY_COIN has drop{}

    fun init(witness: FANTASY_COIN, ctx: &mut TxContext){
        let (treasury_cap, metedata) = coin::create_currency<FANTASY_COIN>(
            witness,
            9,
            b"FANTASY_COIN",
            b"FANTASY",
            b"fantasy coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/177515664")),
            ctx
        );

        transfer::public_freeze_object(metedata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FANTASY_COIN>,
        amount: u64,
        recipent: address,
        ctx: &mut TxContext
    ){
        coin::mint_and_transfer(treasury_cap, amount, recipent, ctx);
    }
}

