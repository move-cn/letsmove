/*
/// Module: riscver
module riscver::riscver;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module riscver::riscver {

    use sui::coin::create_currency;
    use std::option::{none, some};
    use sui::transfer::{public_transfer, public_freeze_object};
    use sui::url;
    use sui::url::{Url};

    public struct RISCVER has drop {

    }

    fun init(riscver: RISCVER, ctx: &mut TxContext) {
        let no = none<Url>();
        let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/203748122");
        let yes = some<Url>(url);

        let (treasury, coinMetaData) = create_currency(riscver, 8, b"RISCVER", b"RISCVER NAME", b"My first Coin Token.", yes, ctx);

        public_freeze_object(coinMetaData);
        public_transfer(treasury, ctx.sender());
    }
}
