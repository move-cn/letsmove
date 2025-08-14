module my_coin::feya_coin {
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct FEYA_COIN has drop {}

    public struct OwnerCap has key { id: UID }

    fun init(witness: FEYA_COIN, ctx: &mut TxContext) {

        transfer::transfer(OwnerCap {
            id: object::new(ctx)
        }, ctx.sender());

        let (treasury_cap, coin_metadata) = coin::create_currency(
            witness,
            9,
            b"FYC",
            b"Feya Coin",
            b"Feya's first coin.",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(coin_metadata);

        transfer::public_transfer(treasury_cap, ctx.sender());
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FEYA_COIN>,
        _: &OwnerCap,
        value: u64,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, value, ctx.sender(), ctx);
    }

    public entry fun burn(
        treasury_cap: &mut TreasuryCap<FEYA_COIN>,
        _: &OwnerCap,
        feya_coin: Coin<FEYA_COIN>
    ): u64 {
        coin::burn(treasury_cap, feya_coin)
    }
}