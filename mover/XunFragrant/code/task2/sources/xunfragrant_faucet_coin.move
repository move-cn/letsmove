module task2::xunfragrant_faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct XUNFRAGRANT_FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: XUNFRAGRANT_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<XUNFRAGRANT_FAUCET_COIN>(
            witness,
            9,
            b"XUNFRAGRANT_FAUCET",
            b"XUNFRAGRANT_FAUCET",
            b"XUNFRAGRANT faucet coin, everyone can access and mutate.",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/100562605")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<XUNFRAGRANT_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<XUNFRAGRANT_FAUCET_COIN>, 
        coin: Coin<XUNFRAGRANT_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}