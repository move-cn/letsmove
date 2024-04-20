module faucet_coin::AYOUNG_FAUCET_COIN {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::balance::{Self, Balance};

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct AYOUNG_FAUCET_COIN has drop {}

    public struct Faucet has key {
        id: UID,
        balance: Balance<AYOUNG_FAUCET_COIN>
    }

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: AYOUNG_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"AYOUNG_FAUCET_COIN", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<AYOUNG_FAUCET_COIN>, 
        amount: u64, 
        recipient: address, 
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

    public entry fun burn(
        treasury_cap: &mut TreasuryCap<AYOUNG_FAUCET_COIN>, 
        coin: Coin<AYOUNG_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }

    public entry fun faucet(
        faucet: &mut Faucet,
        amount: u64,
        ctx: &mut TxContext
    ) {
        let newcoin = coin::take(&mut faucet.balance, amount, ctx);
        transfer::public_transfer(newcoin, tx_context::sender(ctx));
    }
}
