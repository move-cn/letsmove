module mycoin::faucet {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, TreasuryCap};
    use mycoin::mycoin::MYCOIN;

    /// Amount of tokens that can be requested each time (10 tokens considering 9 decimals)
    const FAUCET_AMOUNT: u64 = 10_000_000_000;

    /// The Faucet resource
    struct Faucet has key {
        id: UID,
        treasury_cap: TreasuryCap<MYCOIN>
    }

    /// Create a new faucet
    public entry fun create_faucet(
        treasury_cap: TreasuryCap<MYCOIN>,
        ctx: &mut TxContext
    ) {
        let faucet = Faucet {
            id: object::new(ctx),
            treasury_cap
        };
        transfer::share_object(faucet);
    }

    /// Request tokens from the faucet
    public entry fun request_coins(
        faucet: &mut Faucet,
        ctx: &mut TxContext
    ) {
        let coins = coin::mint(&mut faucet.treasury_cap, FAUCET_AMOUNT, ctx);
        transfer::public_transfer(coins, tx_context::sender(ctx));
    }
} 