module my_coin::dao {
    // test网 ChGCXekcGYoUo7FxoNuBK2PnFtvvSBokb3boCUWVeUZ1
    // coin id  0x476cdc824e1635c1819d231156e10934996b7f504c586076a74ee4b4bb22e24a
    // TreasuryCap   2W2JEs6skBc0CU6iyQ6nrnNLh6HflIV2UBzScyCnTWo=
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
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MYCOIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

}
