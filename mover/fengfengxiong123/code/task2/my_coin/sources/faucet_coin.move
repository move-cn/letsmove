module my_coin::faucetcoin {
    // 包id  0x054f53f96aa56ca74e3f121b63ed6fdbddaae7d306cf0f30c64dba503726b0cc
    // sender 0x1cf6273dc8d5f7f8189fbae937741434d388fefeabe029ac128c2fed67633498

    // TreasuryCap 0x8f26e253f0203dd5372db724eb4779bc697579a18d97fc996beb7f16957adb69
    // 类型 0x2::coin::TreasuryCap<0x54f53f96aa56ca74e3f121b63ed6fdbddaae7d306cf0f30c64dba503726b0cc::dao::DAO>

    // TreasuryCap 0x402a9c44f0563db50cc4d40e503730759c9b80c77249f7364ebf39b3e05a51ed
    // 类型 0x2::coin::TreasuryCap<0x54f53f96aa56ca74e3f121b63ed6fdbddaae7d306cf0f30c64dba503726b0cc::faucetcoin::FAUCETCOIN>

    use sui::coin;
    public struct FAUCETCOIN has drop {}

    fun init(witness: FAUCETCOIN, ctx: &mut TxContext) {

        let (treasury, metadata) = coin::create_currency(
            witness, 9,
            b"FTN",
            b"FaucetCoin",
            b"my faucet coin",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata); // 0x2::coin::CoinMetadata<0x71d67141b2c06e7abdf6829aa2ca8e36cb469fe304519e084c3f29e9e6244824::dao::DAO>
        transfer::public_share_object(treasury);
        // 0x7a2079da6aa6a74d5a3466f98afe96a47cecca0be6c79ef151aa370720f855fd
        //  0x2::coin::TreasuryCap<0x71d67141b2c06e7abdf6829aa2ca8e36cb469fe304519e084c3f29e9e6244824::dao::DAO>
    }

}
