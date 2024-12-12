
/// Module: creatoryuan_coin
module creatoryuan_coin::creatoryuan_coin {
    use std::option::{some};
    use sui::coin::{create_currency};
    use sui::transfer::{public_freeze_object, public_transfer};
    use sui::url;
    use sui::url::Url;


    public struct CREATORYUAN_COIN has drop{}

    fun init(coin: CREATORYUAN_COIN, ctx: &mut TxContext){
        let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/15226478?v=4");
        let pic = some<Url>(url);
        let (treasury, metadata) = create_currency(
            coin,
            6,
            b"CYC",
            b"CreatorYuan Coin",
            b"this is CreatorYuan Coin.",
            pic,
            ctx,
        );
        public_freeze_object(metadata);
        public_transfer(treasury,ctx.sender());
    }

}

