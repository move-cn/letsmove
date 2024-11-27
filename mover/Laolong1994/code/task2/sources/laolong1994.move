module task2_1::laolong1994 {

    use sui::coin::create_currency;
    use std::option::{none, some};
    use sui::transfer::{ public_transfer, public_freeze_object,public_share_object};
    use sui::url::Url;

    public struct LAOLONG1994 has drop {}


    fun init(usd: LAOLONG1994, ctx: &mut TxContext) {
        // https://github.com/MystenLabs/sui/blob/main/crates/sui-framework/packages/sui-framework/sources/coin.move#L211

        //  2     move 100   现实 1     1  0.01
        //  4     move 10000   现实 1     1  0.0001
        let no = none<Url>();
        // let url = url::new_unsafe_from_bytes(b"https://q2.itc.cn/images01/20240223/cd0cd2f403d944fea1826a3df2f8d60d.png");
        // let yes = some<Url>(url);
        let (treasury, coin_metadata) =
            create_currency(usd, 8, b"LAOLONG1994", b"LAOLONG1994", b"this is laolong1994",no, ctx);

        public_freeze_object(coin_metadata);

        public_share_object(treasury);
    }
}


sui client call --package  0x2 --module coin --function mint_and_transfer --type-args 0xc34c6e356a01cc6c2cb8c6aa1e87c0c8cb2969bbbb88c93db91552dfa6d06c8c::laolong1994::LAOLONG1994 --args  0x154db28c5acd4ded1fbbb89534f63beda792201cda56885a2c9e74a25383b27f   12300000000 0x4a8ff94757bdcc3e50a36f2c006c25f5cf53b90cad39393d5821caf34c4419d8