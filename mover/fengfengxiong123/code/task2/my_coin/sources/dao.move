module my_coin::dao {

    use sui::coin;

    public struct DAO has drop {}

    fun init(witness: DAO, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 9,
            b"DAO",
            b"DaoCoin",
            b"dao to all",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
        // 0x54f53f96aa56ca74e3f121b63ed6fdbddaae7d306cf0f30c64dba503726b0cc::dao::DAO
    }
}
