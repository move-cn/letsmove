/*
/// Module: riscver_faucet
module riscver_faucet::riscver_faucet;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module riscver_faucet::riscverfaucet {

    use sui::coin::create_currency;
    use std::option::{none, some};
    use sui::transfer::{public_share_object, public_freeze_object};
    use sui::url;
    use sui::url::{Url};

    public struct RISCVERFAUCET has drop {

    }

    fun init(riscverfaucet: RISCVERFAUCET, ctx: &mut TxContext) {
        let no = none<Url>();
        let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/203748122");
        let yes = some<Url>(url);

        let (treasury, coinMetaData) = create_currency(riscverfaucet, 8, b"RISCVERFAUCET", b"RISCVERFAUCET NAME", b"My first faucet Coin Token.", yes, ctx);

        public_freeze_object(coinMetaData);
        public_share_object(treasury);
    }
}
