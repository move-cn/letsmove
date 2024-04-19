module admin::huisqfaucet {
    use std::option;
    use sui::object::{UID};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::object;
    use sui::tx_context::{Self, TxContext};
    use sui::balance::{Self, Balance};

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    struct HUISQFAUCET has drop {}
    struct Wallet has key {
        id: UID,
        coin: Balance<HUISQFAUCET>
    }

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: HUISQFAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"HUISQFAUCET", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
        let wallet = Wallet {
            id: object::new(ctx),
            coin: balance::zero()
        };
        transfer::share_object(wallet)
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<HUISQFAUCET>, wallet: &mut Wallet, amount: u64, ctx: &mut TxContext
    ) {
        let c1 = coin::mint(treasury_cap, amount, ctx);
        balance::join(&mut wallet.coin, coin::into_balance(c1));
    }

    public entry fun faucet(wallet: &mut Wallet, amount: u64, ctx: &mut TxContext) {
        let c2 = coin::take(&mut wallet.coin, amount, ctx);
        transfer::public_transfer(c2, tx_context::sender(ctx));
    }

}