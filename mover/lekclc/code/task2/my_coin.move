module my_coin::mycoin{
    use std::option;
    use sui::coin::{Self,TreasuryCap,Coin};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Url,Self};

    struct MYCoin has drop{}

    fun init(waitness: MYCoin, ctx: &mut sui::tx_context::TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(waitness,1,b"MYCoin",b"MYCoin",b"",option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/137021569")),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap,tx_context::sender(ctx));
    }
    public entry fun mint(treasury_cap: &mut TreasuryCap<MYCoin>,amount: u64,recipient: address,ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap,amount,recipient,ctx);
    }
    public fun burn(treasury_cap: &mut TreasuryCap<MYCoin>,coin: Coin<MYCoin>) {
        coin::burn(treasury_cap, coin);
    }
}