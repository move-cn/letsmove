
/// Module: facuet_coin
module facuet_coin::fantasy_facuet_coin {

    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct FANTASY_FACUET_COIN has drop {}

    fun init(witness: FANTASY_FACUET_COIN, ctx: &mut TxContext){
        let (treasury_cap, metadata) = coin::create_currency<FANTASY_FACUET_COIN>(
            witness,
            9,
            b"FANTASY_FACUET",
            b"FANTASY_FACUET",
            b"FANTASY's faucet coin, everyone can access and mutate.",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/177515664")),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FANTASY_FACUET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ){
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }


}
