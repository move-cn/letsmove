module lumia001::Lumia001Coin {

    use std::option;

    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::event::emit;
    use sui::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;

    const DECIMAL: u64 = 1_000_000;


    struct LUMIA001COIN has drop {}

    struct MintCoinEvent has copy, drop {
        amt: u64,
        recp: address
    }

    // init coin metadata.
    fun init(witness: LUMIA001COIN, ctx: &mut TxContext) {
        let (treasury, metadata) =
            coin::create_currency(
                witness,
                6,
                b"LUMIA001COIN",
                b"LUMIA001COIN",
                b"LUMIA001COIN description.",
                option::none(),
                ctx
            );

        coin::mint_and_transfer(&mut treasury, (100 * DECIMAL),
            tx_context::sender(ctx), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    // mint some coins.
    entry fun mint(treasury_cap: &mut TreasuryCap<LUMIA001COIN>, amount: u64, recp: address, ctx: &mut TxContext) {
        let coins = coin::mint(treasury_cap, amount * DECIMAL, ctx);
        transfer::public_transfer(coins, recp);
        emit(MintCoinEvent {
            amt: amount,
            recp
        })
    }
}