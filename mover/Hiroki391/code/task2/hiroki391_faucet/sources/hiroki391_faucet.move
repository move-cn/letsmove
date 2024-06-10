// Module: hiroki391_faucet
module hiroki391_faucet::hiroki391_faucet {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct HIROKI391_FAUCET has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: HIROKI391_FAUCET, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<HIROKI391_FAUCET>(
            witness,
            9,
            b"HIROKI391_FAUCET",
            b"HIROKI391_FAUCET",
            b"Hiroki's faucet coin, everyone can access and mutate.",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/165958351?v=4")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<HIROKI391_FAUCET>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<HIROKI391_FAUCET>, 
        coin: Coin<HIROKI391_FAUCET>
    ) {
        coin::burn(treasury_cap, coin);
    }
}