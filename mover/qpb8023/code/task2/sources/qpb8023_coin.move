module task2::qpb8023_coin {

    use sui::coin;

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct QPB8023_COIN has drop {}

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: QPB8023_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"QPB8023 COIN",           // symbol
            b"QPB8023 COIN",       // name
            b"github id qpb8023", // description
            option::none(),   // icon url
            ctx
        );

        // transfer the `TreasuryCap` to the sender, so they can mint and burn
        transfer::public_transfer(treasury, tx_context::sender(ctx));

        // metadata is typically frozen after creation
        transfer::public_freeze_object(metadata);
    }

    public entry fun mint(treasury: &mut coin::TreasuryCap<QPB8023_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }

    public entry fun burn(treasury: &mut coin::TreasuryCap<QPB8023_COIN>, coin: coin::Coin<QPB8023_COIN>) {
        coin::burn(treasury, coin);
    }
}
