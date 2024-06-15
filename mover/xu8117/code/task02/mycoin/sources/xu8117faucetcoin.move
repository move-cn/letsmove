module mycoin::xu8117faucetcoin {
    use std::option;

    use sui::coin::create_currency;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::TxContext;

    public struct XU8117FAUCETCOIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: XU8117FAUCETCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = create_currency<XU8117FAUCETCOIN>(
            witness,
            8,
            b"XU8117XU8117FAUCETCOIN",
            b"",
            b"",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public fun mint(
        treasury: &mut TreasuryCap<XU8117FAUCETCOIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }

    public fun burn(
        treasury: &mut TreasuryCap<XU8117FAUCETCOIN>, coin: Coin<XU8117FAUCETCOIN>
    ) {
        coin::burn(treasury, coin);
    }
}
