module design::usdc {
    use sui::coin;

    public struct USDC has drop {}

    fun init(witness: USDC, ctx: &mut TxContext) {

       // let witness = USDC{};

        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"USDC",           // symbol
            b"USDC",       // name
            b"Don't ask why", // description
            option::none(),   // icon url
            ctx
        );

        transfer::public_transfer(treasury, ctx.sender());

        transfer::public_freeze_object(metadata);
    }



}