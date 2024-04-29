/// Module: task2
module task2::Kecson_Faucet_Coin {
    use std::option;

    use sui::coin;
    use sui::coin::{Coin, TreasuryCap};
    use sui::event::emit;
    use sui::transfer;
    use sui::tx_context::{sender, TxContext};

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
    struct KECSON_FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: KECSON_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,
            b"Faucet Coin",
            b"Task2 Faucet Coin",
            b"This is letsmove task2 Faucet Coin",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury)
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<KECSON_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
        emit(MintEvent { amount, recipient });
    }


    public entry fun burn(
        treasury_cap: &mut TreasuryCap<KECSON_FAUCET_COIN>,
        coin: Coin<KECSON_FAUCET_COIN>,
        ctx: &mut TxContext,
    ) {
        let amount = coin::burn(treasury_cap, coin);
        emit(BurnEvent { amount, owner: sender(ctx) })
    }
}
