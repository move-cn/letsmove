/// Module: faucet_coin
module faucet_coin::funnyyanne_faucet_coin {
    use std::ascii;
    use sui::coin::{Self, TreasuryCap};
    use sui::url;

    public struct FUNNYYANNE_FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: FUNNYYANNE_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,
            b"FUNNYYANNE_FAUCET_COIN",
            b"FUNNYYANNE_FAUCET_COIN",
            b"It is faucet coin. ",
            option::some(url::new_unsafe(ascii::string(b"https://cdn3.iconfinder.com/data/icons/leto-space/64/__space_cat_helmet-1024.png"))),
            ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint_in_my_module(
        treasury_cap: &mut TreasuryCap<FUNNYYANNE_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }

    //hash CoC9RKKeKWk7u9ix55N4m7f5adRvNXePcnkVziLacTtX
    //packageid 0xc23a7d57739bd26fafb3daa58d4aeddcd9d17a6e205e5aaf6897f371bcf97eb2
    //TreasuryCap objectid   0xdb3db2523fd3f7080852e2e0ffa752f89c4eec6087ef4bfac1fe96e80e114469
    //sui client call --package 0xc23a7d57739bd26fafb3daa58d4aeddcd9d17a6e205e5aaf6897f371bcf97eb2 --module funnyyanne_faucet_coin --function mint_in_my_module  --args  0xdb3db2523fd3f7080852e2e0ffa752f89c4eec6087ef4bfac1fe96e80e114469  20000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

}
