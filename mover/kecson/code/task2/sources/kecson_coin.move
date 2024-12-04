/// Module: task2
module task2::Kecson_Coin {
    use std::option;

    use sui::coin;
    use sui::coin::{Coin, TreasuryCap};
    use sui::event::emit;
    use sui::transfer;
    use sui::tx_context::{Self, sender, TxContext};

    struct MintEvent has copy, drop {
        amount: u64,
        recipient: address
    }

    struct BurnEvent has copy, drop {
        amount: u64,
        owner: address
    }

    ///This structure represents token types, each token needs a type: 'Coin<package_object::mycoin::MYCOIN>'
    /// Make sure that the structure name matches the module name
    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    struct KECSON_COIN has drop {}

    ///The module initialization function is called when the module is released.
    ///'TreasuryCap' is sent to the publisher of the module, so the publisher has control over the minting and burning of tokens.
    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: KECSON_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,
            b"Kecson Coin",
            b"Task2 Kecson Coin",
            b"This is letsmove task2 Kecson Coin",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<KECSON_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
        emit(MintEvent { amount, recipient })
    }


    public entry fun burn(
        treasury_cap: &mut TreasuryCap<KECSON_COIN>,
        coin: Coin<KECSON_COIN>,
        ctx: &mut TxContext,
    ) {
        let amount = coin::burn(treasury_cap, coin);
        emit(BurnEvent { amount, owner: sender(ctx) })
    }
}
