/// Module: lihuazhang_coin
module lihuazhang_coin::lihuazhang_coin {

    use sui::url;
    use sui::coin::{Self, TreasuryCap};

    public struct LIHUAZHANG_COIN has drop {}
    
    fun init(otw: LIHUAZHANG_COIN, ctx: &mut TxContext) {

        let decimals = 9;
        let symbol = b"LC";
        let name = b"Lihuazhang Coin";
        let description = b"Lihuazhang Coin Test";
        let icon_url = url::new_unsafe_from_bytes(b"https://testerhome.com/photo/2015/f4a07b35098dc28fa3e4269c8af2fc7b.png");
        let (treasury, metadata) = coin::create_currency(otw, decimals, symbol, name, description, option::some(icon_url), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    entry fun mint(treasury_cap: &mut TreasuryCap<LIHUAZHANG_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}

