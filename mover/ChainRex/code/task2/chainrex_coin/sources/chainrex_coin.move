module chainrex_coin::chainrex_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct CHAINREX_COIN has drop {}

    fun init(
        witness: CHAINREX_COIN,
        ctx: &mut TxContext
    ) {
        let (treasury_cap, metadata) = coin::create_currency<CHAINREX_COIN>(
            witness,
            9,
            b"CHAINREX",
            b"CHAINREX_COIN",
            b"ChainRex Coin",
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"https://avatars.githubusercontent.com/u/76983474"
                )
            ),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(
            treasury_cap,
            tx_context::sender(ctx)
        )
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<CHAINREX_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<CHAINREX_COIN>,
        coin: Coin<CHAINREX_COIN>
    ) {
        coin::burn(treasury_cap, coin);

    }
}
