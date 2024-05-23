/// Module: TomLeel
module mycoin::TomLeel {
    // ----- use -----
    use sui::coin::create_currency;

    // ----- struct -----
    public struct TOMLEEL has drop {}

    // ----- const -----

    // ----- err -----

    // ----- fun -----
    fun init(witness: TOMLEEL, ctx: &mut TxContext) {
        let (treasury, metadata) = create_currency(
            witness,
            6,
            b"TomLeel",
            b"TomLeel made by Tom",
            b"TomLeel made by Tom",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }
}
