/// Module: TomLeelFaucet
module mycoin::TomLeelFaucet {
    // ----- use -----
    use sui::coin::create_currency;

    // ----- struct -----
    public struct TOMLEELFAUCET has drop {}

    // ----- const -----

    // ----- err -----

    // ----- fun -----
    #[allow(lint(share_owned))]
    fun init(witness: TOMLEELFAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = create_currency(
            witness,
            6,
            b"TomLeelFaucet",
            b"TomLeelFaucet made by Tom",
            b"TomLeelFaucet made by Tom",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }
}
