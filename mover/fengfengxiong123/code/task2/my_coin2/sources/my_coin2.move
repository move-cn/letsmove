module my_coin2::dao {
    // 摘要 Coxqzq8Y2EEE9BwANy7wJGvBBBgs8XyH8AvxSKuj1c36
    // sender 0x1cf6273dc8d5f7f8189fbae937741434d388fefeabe029ac128c2fed67633498
    //
    use sui::coin;
    public struct DAO has drop {}

    fun init(witness: DAO, ctx: &mut TxContext) {

        let (treasury, metadata) = coin::create_currency(
            witness, 9,
            b"DAO",
            b"DaoCoin",
            b"dao to all 2",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata); // 0x2::coin::CoinMetadata<0x71d67141b2c06e7abdf6829aa2ca8e36cb469fe304519e084c3f29e9e6244824::dao::DAO>
        transfer::public_share_object(treasury);
        // 0x7a2079da6aa6a74d5a3466f98afe96a47cecca0be6c79ef151aa370720f855fd
        //  0x2::coin::TreasuryCap<0x71d67141b2c06e7abdf6829aa2ca8e36cb469fe304519e084c3f29e9e6244824::dao::DAO>
    }

}
