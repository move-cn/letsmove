/// Module: lihuazhang_coin
module lihuazhang_coin::lihuazhang_faucet_coin {

    use sui::url;
    use sui::coin::{Self, TreasuryCap};

    public struct LIHUAZHANG_FAUCET_COIN has drop {}
    
    fun init(otw: LIHUAZHANG_FAUCET_COIN, ctx: &mut TxContext) {

        let decimals = 9;
        let symbol = b"LC FAUCET";
        let name = b"Lihuazhang Faucet Coin";
        let description = b"Lihuazhang Faucet Coin Test";
        let icon_url = url::new_unsafe_from_bytes(b"https://testerhome.com/photo/2015/f4a07b35098dc28fa3e4269c8af2fc7b.png");
        let (treasury, metadata) = coin::create_currency(otw, decimals, symbol, name, description, option::some(icon_url), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<LIHUAZHANG_FAUCET_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}

