module task2::qpb8023_faucet {

    use sui::coin;

    public struct QPB8023_FAUCET has drop {}

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: QPB8023_FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"QPB8023 FAUCET COIN",           // symbol
            b"QPB8023 FAUCET COIN",       // name
            b"github id qpb8023", // description
            option::none(),   // icon url
            ctx
        );

        // transfer the `TreasuryCap` to the sender, so they can mint and burn
        transfer::public_transfer(treasury, tx_context::sender(ctx));

        // metadata is typically frozen after creation
        transfer::public_freeze_object(metadata);
    }

    public entry fun mint(treasury: &mut coin::TreasuryCap<QPB8023_FAUCET>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }

    public entry fun burn(treasury: &mut coin::TreasuryCap<QPB8023_FAUCET>, coin: coin::Coin<QPB8023_FAUCET>) {
        coin::burn(treasury, coin);
    }
}