module mycoin::Pithos23Faucet {
    use std::option;

    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct TreasuryCapHolder has key {
        id: UID,
        treasury: TreasuryCap<PITHOS23FAUCET>,
    }

    struct PITHOS23FAUCET has drop {}

    fun init(witness: PITHOS23FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) =
            coin::create_currency(witness, 6, b"Pithos23Faucet", b"Pithos23Faucet",
                b"Pithos23 Faucet des.", option::none(), ctx);
        let treasury_cap_holder = TreasuryCapHolder {
            id: object::new(ctx),
            treasury,
        };
        transfer::public_freeze_object(metadata);
        transfer::share_object(treasury_cap_holder)
    }


    entry fun mint(treasury_cap_holder: &mut TreasuryCapHolder, ctx: &mut TxContext) {
        let treasury_cap = &mut treasury_cap_holder.treasury;
        //mint 100 once.
        let coins = coin::mint(treasury_cap, 100_000_000, ctx);
        // send to self.
        transfer::public_transfer(coins, tx_context::sender(ctx))
    }
}