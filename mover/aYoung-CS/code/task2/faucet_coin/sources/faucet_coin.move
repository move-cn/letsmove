module faucet_coin::AYOUNG_FAUCET_COIN {
    use sui::coin::{Self, Coin, TreasuryCap};

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct AYOUNG_FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: AYOUNG_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"AYOUNG_FAUCET_COIN", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury)
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<AYOUNG_FAUCET_COIN>, 
        amount: u64, 
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, tx_context::sender(ctx));
    }

    public entry fun burn(
        treasury_cap: &mut TreasuryCap<AYOUNG_FAUCET_COIN>, 
        coin: Coin<AYOUNG_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }

}
