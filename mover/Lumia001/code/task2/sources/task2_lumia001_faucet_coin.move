module lumia001::Lumia001Faucet {

    use std::option;

    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::object;
    use sui::object::UID;
    use sui::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;

    const DECIMAL: u64 = 1_000_000;


    struct TreasuryCapHolder has key {
        id: UID,
        treasury: TreasuryCap<LUMIA001FAUCET>,
    }

    struct LUMIA001FAUCET has drop {}

    // init coin metadata.
    fun init(witness: LUMIA001FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) =
            coin::create_currency(
                witness,
                6,
                b"LUMIA001FAUCET",
                b"LUMIA001FAUCET",
                b"LUMIA001FAUCET faucet description.",
                option::none(),
                ctx
            );

        let treasury_cap_holder = TreasuryCapHolder {
            id: object::new(ctx),
            treasury,
        };

        transfer::public_freeze_object(metadata);
        transfer::share_object(treasury_cap_holder);
    }

    // mint fixed coins.
    entry fun mint(treasury_cap_holder: &mut TreasuryCapHolder, ctx: &mut TxContext) {
        let treasury_cap = &mut treasury_cap_holder.treasury;
        let coins = coin::mint(treasury_cap, 1000 * DECIMAL, ctx);
        transfer::public_transfer(coins, tx_context::sender(ctx))
    }
}