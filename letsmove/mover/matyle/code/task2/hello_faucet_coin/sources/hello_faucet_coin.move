/*
/// Module: hello_faucet_coin
*/

module hello_faucet_coin::hello_faucet_coin {
    use std::option;
    use std::ascii;
    use sui::coin::{Self, TreasuryCap};
    use sui::url;

    public struct HELLO_FAUCET_COIN has drop{}

    #[allow(lint(share_owned))]
    fun init(witness:HELLO_FAUCET_COIN,ctx: &mut TxContext){
        let (treasury,metadata) = coin::create_currency(
            witness,
            9,
            b"HELLO_FAUCET_COIN",
            b"HELLO_FAUCET_COIN",
            b"it is a hello coin",
            option::some(url::new_unsafe(ascii::string(b"https://cdn3.iconfinder.com/data/icons/leto-space/64/__space_cat_helmet-1024.png"))),
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint_in_my_module(
        treasury_cap: &mut TreasuryCap<HELLO_FAUCET_COIN>,
        amount:u64,
        recipient:address,
        ctx:&mut TxContext
    ){
        let coin = coin::mint(treasury_cap,amount,ctx);
        transfer::public_transfer(coin,recipient);
    }


}
