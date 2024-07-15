// Module: faucet
module faucet::littleP1ng_faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct LITTLEP1NG_FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: LITTLEP1NG_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<LITTLEP1NG_FAUCET_COIN>(
            witness,
            9,
            b"LITTLEP1NG_FAUCET",
            b"LITTLEP1NG_FAUCET",
            b"faucet coin defined by ping, everyone can access and mutate",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/169317857")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<LITTLEP1NG_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<LITTLEP1NG_FAUCET_COIN>, 
        coin: Coin<LITTLEP1NG_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}